class AddOwnerToDebt < ActiveRecord::Migration
  def change
    add_reference :debts, :owner, index: true
  end
end
