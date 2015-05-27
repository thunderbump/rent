class AddDebtToInvoice < ActiveRecord::Migration
  def change
    add_reference :invoices, :debt, index: true
  end
end
