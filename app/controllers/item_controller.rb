class ItemsController < ApplicationController
    
    
    get '/items/new' do #new
        @user = User.find_by(id:session[:user_id])
        @lists = @user.lists
        erb :'items/new'
    end

    post '/items/new' do #create
        @item = Item.create(params[:item])
        redirect to "/lists/#{@item.list_id}"
    end

    get '/items/:id' do #show
        @user = User.find_by(id:session[:user_id])
        if @user.items.find_by_id(params[:id].to_i) == nil
            erb :'sessions/error'
        else
            @item = Item.find_by(id:params[:id])
            @user = User.find_by(id:session[:user_id])
            erb :'items/show'
        end
    end

    get '/items/:id/edit' do #edit
        @item = Item.find_by(id:params[:id])
        @user = User.find_by(id:session[:user_id])
        @lists = @user.lists
        erb :'items/edit'
    end

    patch '/items/:id' do #update
        @item = Item.find_by(id:params[:id].to_i)
        @item.update(params[:item])
        redirect to "/items/#{@item.id}"
    end

    delete '/items/:id' do 
    end
        
end