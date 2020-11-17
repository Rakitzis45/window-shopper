class ListsController < ApplicationController

    get '/lists/new' do
        erb :'lists/new'
    end

    post '/lists/new' do
        List.create(name:params[:list][:name], user_id: session[:user_id].to_i)
        redirect to "/user/#{session[:user_id]}"
    end

    get '/lists/:id' do
        @user = User.find_by(id:session[:user_id])

        if @user.lists.find_by_id(params[:id].to_i) == nil
            erb :'sessions/error'
        else
        #find a way to check to see if list_id is in @user.lists
        #if it is continue
        #else redirect to error page
        @list = List.find_by(id:params[:id])
        erb :'lists/show'
        end

    end



end