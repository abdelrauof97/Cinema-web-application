30.times do
  movie = Movie.new
  movie.title = Faker::Movie.quote
  movie.description = "this is description for #{movie.title}  movie\n until the is the completon for description"
  movie.save
end

Customer.create(username: "admin", name: Faker::Name.name, email: "admin@gmail.com", password: "admin")
Customer.create(username: "user", name: Faker::Name.name, email: "user@gmail.com", password: "user")

counter = 1
10.times do
  Customer.create(username: "user#{counter}", name: Faker::Name.name, email: Faker::Internet.email, password: "secret")
  counter += 1
end
