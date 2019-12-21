require "sinatra/base"
require "sinatra/activerecord"

require "./lib/user"

class ExpenseTracker < Sinatra::Base

  register Sinatra::ActiveRecordExtension
  set :database_file, "config/database.yml"

  get "/" do
    "Welcome to the best expense tracker application out there!"
  end
  
  run! if app_file == $0

end
