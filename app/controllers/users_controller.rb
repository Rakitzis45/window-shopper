class UsersController < ApplicationController

    get "/user" do #index
        "test"
    end

    get '/signup' do #new
        
        if logged_in?
            current_user
            redirect to "/user/#{@user.id}"
            
        else
            erb :'sessions/signup'
        end
    end

    get '/user/:id' do #show
        if !logged_in?
            redirect to '/login'
        end
        if session[:user_id] == params[:id]
            @user = User.find_by(id:session[:user_id])
            
            erb :'users/homepage'
        else
            erb :'sessions/error'
        end 
    end

    get '/user/:id/edit' do #edit
        @user = User.find_by(id:session[:user_id])
        erb :'users/edit'
    end

    post '/signup' do #create 
        @user = User.new(params[:user])
        already_taken?
        session[:user_id] = @user.id.to_s
        redirect to "/user/#{@user.id}"

    end


    patch '/user/:id' do #update
        @user = User.find_by(id:session[:user_id])
        if params[:user][:password] == "" && params[:user][:username] != ""
            update_username
        elsif params[:user][:username] != "" && params[:user][:password] != ""
           @user.update(params[:user]) 
           redirect to "/user/#{session[:user_id]}"
        else
            redirect to "/user/#{session[:user_id]}/edit"
        end
    end

    delete '/user/:id/delete' do
        @user = User.find_by(id:session[:user_id])
        @user.destroy
        session.clear
        redirect to '/login'
    end


end