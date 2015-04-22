class AddAcceptedToPayment < ActiveRecord::Migration
  def change
    add_column :payments, :accepted, :boolean
  end
end
