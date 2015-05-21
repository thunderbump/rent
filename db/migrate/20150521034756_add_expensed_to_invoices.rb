class AddExpensedToInvoices < ActiveRecord::Migration
  def change
    add_column :invoices, :expensed, :boolean
  end
end
