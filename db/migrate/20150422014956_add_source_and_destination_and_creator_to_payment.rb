class AddSourceAndDestinationAndCreatorToPayment < ActiveRecord::Migration
  def change
    add_reference :payments, :source, index: true
    add_reference :payments, :destination, index: true
    add_reference :payments, :creator, index: true
  end
end
