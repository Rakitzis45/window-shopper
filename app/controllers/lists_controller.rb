class ListsController < ApplicationController

    get '/lists/new' do
        erb :'lists/new'
    end

    post '/lists/new' do
        List.create(name:params[:list][:name], user_id: session[:user_id].to_i)
        redirect to "/user/#{session[:user_id]}"
    end

    get '/lists/:id' do
        binding.pry
        @user = User.find_by(id:session[:user_id])
        @list = List.find_by(id:params[:id])
        erb :'lists/show'
    end



end