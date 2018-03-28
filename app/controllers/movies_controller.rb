class MoviesController < ApplicationController
    
  get '/movies' do 
    redirect '/login' unless logged_in?
    @movies = Movie.all 
    @customer = current_user
    erb :'/movies/index'
  end
  
  get '/movies/new' do 
    redirect '/login' unless logged_in?
    @customer = current_user
    if @customer.username = "admin"
      erb :'/movies/new'
    else 
      redirect '/movies'  
    end
  end
    
  get '/movies/:id' do
    if logged_in?
      @movie = Movie.find(params[:id])
      @customer = current_user
      erb :'movies/show'
    else
      redirect to '/login'
    end
  end
  
  post "/movies/:customer_id/resrvation/:movie_id" do 
    @movie = Movie.find(params[:movie_id])
    @customer = Customer.find(params[:customer_id])
    @ticket = Ticket.create(price: 25)
    @ticket.movie = @movie
    @ticket.customer = @customer
    @ticket.save
    binding.pry
    redirect "/customers/#{@customer.slug}"
  end
  
  get '/movies/:id/tickets' do
    redirect '/login' unless logged_in? 
    redirect '/profile' unless current_user.username == "admin"
    @movie = Movie.find(params[:id])
    erb :'/movies/tickets/index'
  end
    
  post '/movies' do 
    if params[:movie][:title] != "" && params[:movie][:description] != ""
      @movie = Movie.create(title: params[:movie][:title], description: params[:movie][:description])
      @current_customer = current_user
      redirect "/movies/#{@movie.id}"
    end 
    redirect '/movies/new'
  end
    
  get '/movies/:id/edit' do 
    redirect '/login' unless logged_in?
    redirect '/movies' unless current_user.username == "admin"
    @movie = Movie.find(params[:id])
    erb :'/movies/edit'
  end
  
  post '/movies/:id' do 
    binding.pry
    @movie = Movie.find(params[:id])
    if params[:movie][:title] != "" && params[:movie][:description] != ""
      @movie.update(title: params[:movie][:title], description: params[:movie][:description])
      redirect "/movies/#{@movie.id}"
    end
    redirect "/movies/#{@movie.id}/edit"
  end

  delete '/movies/:id/delete' do 
    redirect '/login' unless logged_in?
    @movie = Movie.find(params[:id])
    if current_user.username == "admin"
      @movie.delete
    end
    redirect '/movies'
  end
  
end