class CreateDebtors < ActiveRecord::Migration
  def change
    create_table :debtors do |t|
      t.belongs_to :user, index: true
      t.belongs_to :debt, index: true

      t.timestamps
    end

  end
end
