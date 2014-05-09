require 'nancy'
require 'nancy/render'
require './environment'
require './env'
require_relative 'models/user'


class TenshitterApp < Nancy::Base
  include Nancy::Render
  use Rack::Session::Cookie, secret: ENV['SECRET_TOKEN']
  use Rack::Static, :root => "public", :urls => ["/js", "/css", "/fonts", "/images"]

  get "/" do
    render "views/index.erb"
  end

  get "/users/new" do
    render "views/form.erb"
  end

  get "/tenshis" do
    u = User.find(session["user_id"])
    @username = u.username
    followings = u.followings
    @tenshis = Tenshi.where(user_id: followings, deleted_at: nil).order('created_at DESC').limit('30')
    session["last_tenshi_id"] = @tenshis.first.id if u.tenshis.count != 0
    render "views/tenshis.erb"
  end

  get "/:username" do
    @current_user = User.find(session["user_id"])
    @search_user = User.find(session["search_user"])
    if @current_user.username == @search_user.username
      @tenshis = Tenshi.where(user_id: @current_user, deleted_at: nil).order('created_at DESC').limit('30')
      render "views/username.erb"
    else
      session["search_user"] = @current_user.id
      @tenshis = Tenshi.where(user_id: @search_user, deleted_at: nil).order('created_at DESC').limit('30')
      if Relationship.find_by(follower_id: @current_user, following_id: @search_user)
        @following = true
      else
        @following = false
      end
      render "views/user.erb"
    end
  end

  get "/tenshis/news" do
    render "views/tenshis_news.erb"
  end

  get "/settings/edit" do
    @u = User.find(session["user_id"])
    render "views/edit.erb"
  end

  post "/search/user" do
    if @u2 = User.find_by(username: params["user"], deleted_at: nil)
      session["search_user"] = @u2.id
      u1 = User.find(session["user_id"])
      if params["user"] != u1.username
        response.redirect("/#{params["user"]}")
      else
        response.redirect("/#{u1.username}")
      end
    else
      u1 = User.find(session["user_id"])
      session["error_search_user"] = "No results for #{params["user"]}. Try again"
      response.redirect("/#{u1.username}")
    end
  end

  post "/:user_id/follow" do
    u = User.find(session["user_id"])
    u2 = User.find(params["user_id"])
    u.follow(u2)
  end

  post "/:user_id/unfollow" do
    u = User.find(session["user_id"])
    u2 = User.find(params["user_id"])
    u.unfollow(u2)
  end

  post "/users" do
    if params["password"] == params["confirmpassword"] && params["password"] != nil
      user = User.create(name: params["name"], email: params["email"], password: params["password"], username: params["username"])
      begin
        User.find(user.id)
      rescue ActiveRecord::RecordNotFound
        @error_form = true
        render "views/form.erb"
      else
        Relationship.create(follower: user, following: user)
        render "views/index.erb"
      end
    else
      @error_password = true
      render "views/form.erb"
    end
  end

  post "/signin" do
    if user = User.find_by(username: params["username"], password: params["password"], deleted_at: nil)
        session["user_id"] = user.id
        session["search_user"] = user.id
        response.redirect("/tenshis")
    else
      @error_index = true
      render "views/index.erb"
    end
  end

  post "/tenshis" do
    u = User.find(session["user_id"])
    if u.tenshee(params["tenshi"])
      response.redirect("/tenshis")
    end
  end

  post "/tenshis/:tenshi_id/retenshee" do
    u = User.find(session["user_id"])
    u.retenshee(params["tenshi_id"])
  end

  post "/tenshis/:reply_id/reply" do
    u = User.find(session["user_id"])
    u.reply(params["message"], params["reply_id"])
  end

  delete "/tenshis/:id" do
    id = Tenshi.find(params["delete_id"])
    id.update(deleted_at: Date.today)
  end

  post "/username/signout" do
    session["user_id"] = nil
  end

  post "/tenshis/news" do
    u = User.find(session["user_id"])
    last_tenshi_id = session["last_tenshi_id"]
    followings = u.followings
    @tenshis_news = Tenshi.where(user_id: followings, deleted_at: nil).where("id > ?", last_tenshi_id).order('created_at DESC')
    response.headers["Content-Type"] = "text/html"
    render "views/tenshis_news.erb"
  end

  delete "/:username" do
    id = User.find(params["user_id"])
    id.update(deleted_at: Date.today)
  end

  post "/settings/edit" do
    u = User.find(session["user_id"])
    u.update(name: params["name_edit"], email: params["email_edit"], password: params["password_edit"], username: params["username_edit"])
    response.redirect("/#{u.username}")
  end
end