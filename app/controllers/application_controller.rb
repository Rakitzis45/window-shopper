require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    enable :sessions
    set :session_secret, "9c7d0e3e1a9b53cae1f7db4ebdeac54d" 
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  before do 
    
    pass if request.path_info == "/login" || request.path_info == "/signup" || request.path_info =="/error" || request.path_info =="/"
    current_user
    if logged_in? == false
      redirect to '/error'
    end
  end

  get "/" do
    redirect to '/login'
  end

  get "/error" do 
    erb :'sessions/error'
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

    def current_user
      @user = User.find_by(id:session[:user_id])
    end

    def your_list?
      !!@user.lists.find_by_id(params[:id].to_i)
    end

    def your_item?
      !!@user.items.find_by_id(params[:id].to_i)
    end

    def current_item
      @item = Item.find_by(id:params[:id].to_i)
    end
    def current_list
      @list = List.find_by(id:params[:id])
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
