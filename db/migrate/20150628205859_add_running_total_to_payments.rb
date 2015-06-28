class AddRunningTotalToPayments < ActiveRecord::Migration
  def change
    add_column :payments, :running_total, :float
  end
end
