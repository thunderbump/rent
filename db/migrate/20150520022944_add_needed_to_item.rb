class AddNeededToItem < ActiveRecord::Migration
  def change
    add_column :items, :needed, :boolean
  end
end
