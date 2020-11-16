require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    enable :sessions
    set :session_secret, SecureRandom.hex(64) 
    set :public_folder, 'public'
    set :views, 'app/views'
    end


    get "/" do
      erb :welcome
    end
  

end
