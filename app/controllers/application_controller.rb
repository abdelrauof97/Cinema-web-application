require './config/environment'
require_relative '../helpers/helpers.rb'
require 'rack-flash'

class ApplicationController < Sinatra::Base
  
  include Helpers
  
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions unless test?
    set :session_secret, "secret"
  end
  
  get '/' do 
    erb :index
  end
  
  get '/about' do 
    erb :about
  end

end
