class CreateMovieCustomers < ActiveRecord::Migration[5.1]
  def change
    create_table :movie_customers do |t|
      t.integer :movie_id
      t.integer :customer_id
    end
  end
end
