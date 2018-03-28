class AddingAttributesToTickets < ActiveRecord::Migration[5.1]
  def change
    add_column :tickets, :movie_id, :integer
    add_column :tickets, :customer_id, :integer
  end
end
