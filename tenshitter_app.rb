require 'rack/utils'
require 'nancy'
require './environment'
require_relative 'models/user'


class TenshitterApp < Nancy::Base
  include Nancy::Render
  use Rack::Static, :urls => ["/js", "/css", "/fonts", "/images"], :root => "public"

  get "/" do
    render "public/index.html"
  end

  get "/users" do
    render "public/form.html"
  end

  get "/timeline" do
    render "public/timeline.html"
  end

  post "/users" do
    if User.create(name: params["name"], email: params["email"], password: params["password"], username: params["username"])
      render "public/index.html"
    else
      render
    end
  end

  post "/login" do
    if user = User.find_by(username: params["username"], password: params["password"])
      $id = user.id
      render "public/timeline.html"
    else
      render
    end
  end

  post "/timeline" do
    user = User.find_by($id)
    if user.tenshee(params["tenshi"])
      render "public/timeline.html"
    end
  end
end