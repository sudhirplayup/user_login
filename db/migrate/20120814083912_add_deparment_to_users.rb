class AddDeparmentToUsers < ActiveRecord::Migration
  def change
    add_column :users, :deparment, :string
  end
end
