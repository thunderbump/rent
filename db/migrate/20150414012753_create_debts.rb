class CreateDebts < ActiveRecord::Migration
  def change
    create_table :debts do |t|
      t.float :amount
      t.string :description

      t.timestamps
    end

    add_reference :users, :owner, index: true
  end
end
