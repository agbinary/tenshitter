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

  post "/users" do
    if User.create(name: params["name"], email: params["email"], password: params["password"], username: params["username"])
      render "public/index.html"
    else
      render
    end
  end

  post "/login" do
    if User.find_by(username: params["username"], password: params["password"])
      render "public/timeline.html"
    else
      render
    end
  end
end