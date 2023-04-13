# app.rb

require 'sinatra/base'
require 'sinatra/reloader' if development?
require 'sinatra/activerecord'
require 'bcrypt'
require_relative 'models/article'
require_relative 'models/comment'
require_relative 'models/user'
require_relative 'routes/article_detail'
require_relative 'routes/article_form'
require_relative 'routes/article_list'
require_relative 'routes/comment_form'
require_relative 'routes/comment_list'
require_relative 'routes/login_form'
require_relative 'routes/user_form'

# Configure database connection
set :database, { adapter: 'sqlite3', database: 'db/development.sqlite3' }

class App < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  enable :sessions

  # Define helpers for authentication
  helpers do
    def current_user
      @current_user ||= User.find_by(id: session[:user_id])
    end

    def authenticated?
      !current_user.nil?
    end

    def require_authentication
      redirect '/login' unless authenticated?
    end
  end

  # Define root route
  get '/' do
    redirect '/articles'
  end
end
