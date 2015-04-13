class AddShareToUsers < ActiveRecord::Migration
  def change
    add_column :users, :share, :float, :default => 1.0
  end
end
