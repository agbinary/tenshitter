require 'nancy'
require 'nancy/render'
require './environment'
require_relative 'models/user'


class TenshitterApp < Nancy::Base
  include Nancy::Render
  use Rack::Session::Cookie, secret: ENV['SECRET_TOKEN']
  use Rack::Static, :root => "public", :urls => ["/js", "/css", "/fonts", "/images"]

  get "/" do
    render "views/index.html"
  end

  get "/users" do
    render "views/form.html"
  end

  get "/timeline" do
    render "views/timeline.html"
  end

  post "/users" do
    user = User.create(name: params["name"], email: params["email"], password: params["password"], username: params["username"])
    begin
      User.find(user.id)
    rescue ActiveRecord::RecordNotFound
      render "views/form_error.html"
    else
      render "views/index.html"
    end
  end


  post "/login" do
    if $u = User.find_by(username: params["username"], password: params["password"])
      render "views/timeline.html"
    else
      render "views/index_error.html"
    end
  end

  post "/timeline" do
    if $u.tenshee(params["tenshi"])
      render "views/timeline.html"
    end
  end

end
