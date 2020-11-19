class ItemsController < ApplicationController

    
    get '/items/new' do #new
        @lists = @user.lists
        erb :'items/new'
    end

    post '/items/new' do #create
        
        if @user.lists.find_by(id:params[:item][:list_id]) == nil
            redirect to '/error'
        else
            @item = Item.create(params[:item])
            redirect to "/lists/#{@item.list_id}"
        end
    end

    get '/items/:id' do #show
        if your_item? == false
            erb :'sessions/error'
        else
            @item = Item.find_by(id:params[:id])
            erb :'items/show'
        end
    end

    get '/items/:id/edit' do #edit
        if your_item? == false
            erb :'sessions/error'
        else
            @item = Item.find_by(id:params[:id])
            @lists = @user.lists
            erb :'items/edit' 
        end
        
    end

    patch '/items/:id' do #update
        current_item
        if your_item? == false
            erb :'sessions/error'
        elsif @user.lists.find_by(id:params[:item][:list_id].to_i) == nil
            redirect to '/error'
        else 
            @item.update(params[:item])
            redirect to "/items/#{@item.id}"
        end
    end

    delete '/items/:id' do #delete
        binding.pry
        if your_item? == false 
            erb :'sessions/error'
        else
            current_item
            list = @item.list_id
            @item.destroy
            redirect to "/lists/#{list}"
        end
    end
        
end