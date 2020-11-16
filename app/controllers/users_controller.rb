class UsersController < ApplicationController

    get "/user" do 
        "hello World"
        binding.pry
    end

    get '/user/new' do #new
    end

    get '/user/:id' do #show
        
    end

    post '/user/new' do #create 
    end

    get '/user/:id/edit' do #edit
    end

    patch '/user/:id' do #update
    end

end