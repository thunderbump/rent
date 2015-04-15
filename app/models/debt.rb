class Debt < ActiveRecord::Base
  belongs_to :owner, class_name: "User"
  has_many :debtors
  has_many :users, through: :debtors

  accepts_nested_attributes_for :debtors

end
