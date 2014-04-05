require 'rack/utils'
require 'rack'
require 'nancy'
require './environment'
require_relative 'models/user'


class TenshitterApp < Nancy::Base
  include Nancy::Render

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
    if User.create(name: params["name"], email: params["email"], password: params["password"], username: params["username"])
      render "views/index.html"
    else
      render "views/index_error.html"
    end
  end


  post "/login" do
    if User.find_by(username: params["username"], password: params["password"])
      render "views/timeline.html"
    else
      render "views/index_error.html"
    end
  end

  post "/timeline" do
    if user.tenshee(params["tenshi"])
      render "views/timeline.html"
    end
  end
end