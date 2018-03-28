class Movie < ActiveRecord::Base 
  
  has_many :tickets
  has_many :movie_customers
  has_many :customers, through: :tickets
  
end