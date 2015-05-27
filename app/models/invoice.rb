class Invoice < ActiveRecord::Base
  belongs_to :owner, class_name: "User"
  belongs_to :debt

  has_many :line_items
  has_many :items, through: :line_items

  accepts_nested_attributes_for :items
end
