class UsersController < ApplicationController

    get "/user" do #index
        "test"
    end

    get '/signup' do #new
        
        if logged_in?
            redirect to '/user/:id'
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

    post '/signup' do #create 
        @user = User.new(params[:user])
        already_taken?
        redirct to '/login'
        
    end

    get '/user/:id/edit' do #edit
    end

    patch '/user/:id' do #update
    end

end