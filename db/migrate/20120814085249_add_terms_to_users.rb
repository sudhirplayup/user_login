class AddTermsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :terms, :string
  end
end
