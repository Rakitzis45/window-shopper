require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    enable :sessions
    set :session_secret, "secret" 
    set :public_folder, 'public'
    set :views, 'app/views'
  end
  get "/" do
    erb :welcome
  end

  helpers do
    def logged_in?
      !!session[:user_id]
    end

    def already_taken?
      if User.find_by(username: params[:user][:username]) == nil
        @user.save
      else
        redirect to '/signup'
      end
    end

    def update_username
      if User.find_by(username: params[:user][:username]) == nil
        @user.username = params[:user][:username]
        @user.save
        redirect to "/user/#{session[:user_id]}"
      else
        redirect to "/user/#{session[:user_id]}/edit"
      end
    end
  end
end
