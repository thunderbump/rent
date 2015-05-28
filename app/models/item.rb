class Item < ActiveRecord::Base
  has_many :line_items
  has_many :invoices, through: :line_items

  validates_uniqueness_of :description
end
