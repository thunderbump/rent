class Invoice < ActiveRecord::Base
  belongs_to :owener, class_name: "User"

  has_many :line_items
  has_many :items, through: :line_items

  accepts_nested_attributes_for :items
end
