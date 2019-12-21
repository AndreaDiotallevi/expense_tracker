require "sinatra/base"
require "sinatra/activerecord"

require "./lib/user"

class ExpenseTracker < Sinatra::Base

  register Sinatra::ActiveRecordExtension
  set :database_file, "config/database.yml"

  run! if app_file == $0

end
