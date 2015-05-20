class AddInvoiceAndItemToLineItem < ActiveRecord::Migration
  def change
    add_reference :line_items, :invoice, index: true
    add_reference :line_items, :item, index: true
  end
end
