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
  end
end
