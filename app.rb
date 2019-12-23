require 'bcrypt'
require "sinatra/base"
require "sinatra/activerecord"
require "sinatra/flash"

require "./lib/user"
require "./lib/theme"
require "./lib/participation"
require "./lib/expense"

class ExpenseTracker < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  register Sinatra::Flash
  set :database_file, "config/database.yml"
  enable :sessions

  get "/" do
    erb :"index"
  end

  get "/users/new" do
    erb :"users/new"
  end
  
  post "/users" do
    if params[:password] == params[:"confirm-password"]
      encrypted_password = BCrypt::Password.create(params[:password])
      user = User.create(first_name: params[:"first-name"], surname: params[:surname],
                         email: params[:"email"], password: encrypted_password)
      session[:user_id] = user.id
      redirect "/themes"
    else
      flash[:notice] = "Please enter two matching passwords"
      redirect "/users/new"
    end
  end

  get "/sessions/new" do
    erb :"sessions/new"
  end

  post "/sessions" do
    user = User.where(email: params[:email]).first
    if user && BCrypt::Password.new(user.password) == params[:password]
      session[:user_id] = user.id
      redirect "/themes"
    else
      flash[:notice] = "Please check your email or password"
      redirect "/sessions/new"
    end
  end

  post "/sessions/destroy" do
    session.clear
    flash[:notice] = 'You have logged out'
    redirect "/"
  end

  get "/themes" do
    @user = User.find(session[:user_id])
    @themes = @user.themes
    erb :"themes/index"
  end

  get "/themes/new" do
    erb :"themes/new"
  end

  get "/themes/:id" do
    @theme = Theme.find(params[:id])
    erb :"themes/show"
  end

  post "/themes" do
    @theme = Theme.create(title: params[:title])
    Participation.create(user_id: session[:user_id], theme_id: @theme.id)
    redirect "/themes"
  end

  get "/themes/:id/participations/new" do
    @theme = Theme.find(params[:id])
    erb :"participations/new"
  end

  post "/themes/:id/participations" do
    @user = User.where(first_name: params[:"first-name"], surname: params[:surname]).first
    @theme = Theme.find(params[:id])
    Participation.create(user_id: @user.id, theme_id: @theme.id)
    redirect "/themes/#{params[:id]}"
  end

  get "/themes/:id/expenses/new" do
    @theme = Theme.find(params[:id])
    erb :"expenses/new"
  end

  post "/themes/:id/expenses" do
    @theme = Theme.find(params[:id])
    Expense.create(user_id: session[:user_id], theme_id: @theme.id,
                   amount: params[:amount], description: params[:description])
    redirect "/themes/#{params[:id]}"
  end
  
  run! if app_file == $0
end
