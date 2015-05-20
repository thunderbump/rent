class AddOwnerToInvoice < ActiveRecord::Migration
  def change
    add_reference :invoices, :owner, index: true
  end
end
