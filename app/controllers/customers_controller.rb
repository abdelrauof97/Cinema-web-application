
class CustomersController < ApplicationController
  
  use Rack::Flash

  get '/signup' do 
    redirect '/movies' if logged_in?
    erb :'/customers/signup'
  end
  
  post '/signup' do  
    if params[:username] != "" && params[:email] != "" && params[:password] != "" && params[:name] != "" 
      @customer = Customer.create(username: params[:username], email: params[:email], password: params[:password]) 
      login(@customer)
      flash[:message] = "Welcome, #{@customer.username}"
      redirect "/movies"
    else 
      redirect '/signup'
    end 
  end
  
  get '/login' do 
    redirect '/movies' if logged_in?
    erb :'/customers/login'
  end 
  
  post '/login' do 
    @customer = Customer.find_by(username: params[:username])
    if @customer && @customer.authenticate(params[:password])
      login(@customer)
      flash[:message] = "You Have Logged in Succefuly"
      redirect "/movies"
    end
    redirect '/login'
  end
  
  get '/logout' do 
    if logged_in?
      logout!
    end 
    redirect '/login'
  end
  
  get '/customers/:slug' do 
    redirect '/login' unless logged_in?
    @customer = Customer.find_by_slug(params[:slug])
    if @customer.username  == "admin"
      erb :'/customers/admin'
    elsif @customer = current_user
      erb :'/customers/profile'
    end
  end
  
end