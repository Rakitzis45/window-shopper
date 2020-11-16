class SessionController < ApplicationController
    get '/login' do
        if logged_in?
    
            redirect to "/user/#{session[:user_id]}"
        end
        erb :'sessions/login'
    end

    post '/login' do
        user = User.find_by(username:params[:username])
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id.to_s
            redirect to "/user/#{user.id}"
        else
            redirect to '/login'
        end
    end

    get '/logout' do
        session.clear
        redirect to '/login'
    end

   
end