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

  get "/users" do
    render "views/form.erb"
  end

  get "/timeline" do
    render "views/timeline.erb"
  end

  post "/users" do
    user = User.create(name: params["name"], email: params["email"], password: params["password"], username: params["username"])
    begin
      User.find(user.id)
    rescue ActiveRecord::RecordNotFound
      session["error_form_message"] = "Missing or invalid data, please check the errors and try again"
      render "views/form.erb"
    else
      render "views/index.erb"
    end
  end

  post "/login" do
    if user = User.find_by(username: params["username"], password: params["password"])
      session["user_id"] = user.id
      render "views/timeline.erb"
    else
      session["error_index_message"] = "The username/password combination is wrong"
      render "views/index.erb"
    end

  end

  post "/timeline" do
    if User.tenshee(params["tenshi"])
      render "views/timeline.erb"
    end
  end

end
