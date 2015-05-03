class Payment < ActiveRecord::Base
  include PaymentsHelper

  belongs_to :source, class_name: "User"
  belongs_to :destination, class_name: "User"
  belongs_to :creator, class_name: "User"

  validate :source_and_destination_cannot_be_equal
  validates :amount, :numericality => { :greater_than_or_equal_to => 0 }
  validates :source, :destination, :creator, presence: true
  
  #This should return negative. It's only used when payments are used in 
  #conjunction with debts who's user_share should be positive.
  def users_share(user)
    if user.id == source.id
      return amount * -1
    end
    return amount
  end

  def owner
    return destination
  end

  def to_s
    description
  end

  #def description
  #  return "Payment from " + source.first_name +
  #         " to " + destination.first_name + 
  #         " of " + number_to_currency(amount)
  #end

  #########################################
  #Validations
  #########################################
  def source_and_destination_cannot_be_equal
    if source == destination
      errors.add(:source, "can't be the same as the destination")
    end
  end
end
