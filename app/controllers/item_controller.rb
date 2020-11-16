class ItemsController < ApplicationController
    
    
    get '/items/new' do
        @user = User.find_by(id:session[:user_id])
        @lists = @user.lists
        erb :'items/new'
    end

    post '/items/new' do
        @item = Item.create(params[:item])
        redirect to "/lists/#{@item.list_id}"
    end
end