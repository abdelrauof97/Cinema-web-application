class Customer < ActiveRecord::Base 
  
  has_secure_password
  has_many :tickets
  has_many :movie_customers
  has_many :movies, through: :tickets
  
  def slug
    self.username.split(" ").join("-")
  end
  
  def self.find_by_slug(slug)
    Customer.find_by(username: slug.split("-").join(" "))
  end
  
end