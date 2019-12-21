require "sinatra/base"
require "sinatra/activerecord"

require "./lib/user"

class ExpenseTracker < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  set :database_file, "config/database.yml"
  enable :sessions

  get "/" do
    erb :index
  end
  
  post "/users/new" do
    user = User.create(first_name: params[:"first-name"],
                       surname: params[:"surname"],
                       email: params[:"email"],
                       password: params[:"password"])
    session[:user_id] = user.id
    redirect "/themes"
  end

  get "/themes" do
    @user = User.find(session[:user_id])
    erb :"themes/index"
  end
  
  run! if app_file == $0
end
