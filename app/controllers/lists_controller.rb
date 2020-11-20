class ListsController < ApplicationController

    get '/lists' do
        @lists = @user.lists.all
        erb :'lists/index'
    end

    get '/lists/new' do #new
        erb :'lists/new'
    end

    post '/lists/new' do #create
        List.create(name:params[:list][:name], user_id: @user.id)
        redirect to "/user/#{@user.id}"
    end

    get '/lists/:id' do #show
        current_list
        if your_list? == false
            redirect to "/error"
        end
        erb :'lists/show'       
    end

    get '/lists/:id/edit' do #edit
        current_list
        if your_list? == false
            erb :'sessions/error'
        else
            @list = List.find_by(id:params[:id])
            erb :'lists/edit'    
        end
    end

    patch '/lists/:id' do #update
        if your_list? == false
            erb :'sessions/error'
        else
            current_list
            @list.update(params[:list])
            redirect to "/lists/#{@list.id}"
        end
    end

    delete '/lists/:id' do #delete
        if your_list? == false
            erb :'sessions/error'
        else
            current_list
            @list.destroy
            redirect to "/user/#{session[:user_id]}"
        end
    end




end