class AddFirstNameAndLastNameToUser < ActiveRecord::Migration
  def change
    add_column :users, :first_name, :string, :null => false, :default => "John"
    add_column :users, :last_name, :string, :null => false, :default => "Doe"
  end
end
