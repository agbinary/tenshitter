require 'rack/utils'
require 'nancy'
require './environment'
require_relative 'models/user'

class TenshitterApp < Nancy::Base
  include Nancy::Render

  get "/" do
    render "views/form.html"
  end

  post "/users" do
    if User.create(name: params["name"], email: params["email"], password: params["password"], username: params["username"])
      render "views/index.html"
    end
  end


end