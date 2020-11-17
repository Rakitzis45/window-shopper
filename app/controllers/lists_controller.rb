class ListsController < ApplicationController

    get '/lists/new' do #new
        erb :'lists/new'
    end

    post '/lists/new' do #create
        List.create(name:params[:list][:name], user_id: session[:user_id].to_i)
        redirect to "/user/#{session[:user_id]}"
    end

    get '/lists/:id' do #show
        @user = User.find_by(id:session[:user_id])
        
        if @user.lists.find_by_id(params[:id].to_i) == nil
            erb :'sessions/error'
        else
        @list = List.find_by(id:params[:id])
        erb :'lists/show'
        end
    end

    get '/lists/:id/edit' do #edit
        @list = List.find_by(id:params[:id])
        erb :'/lists/edit'
    end

    patch '/lists/:id' do #update
        @list = List.find_by(id:params[:id])
        @list.update(params[:list])
        redirect to "/lists/#{@list.id}"
    end

    delete '/lists/:id' do #delete
        @list = List.find_by(id:params[:id])
        @list.destroy
        redirect to "/user/#{session[:user_id]}"
    end




end