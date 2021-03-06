class Debt < ActiveRecord::Base
  belongs_to :owner, class_name: "User"
  has_many :debtors
  has_many :users, through: :debtors
  has_one :invoice

  accepts_nested_attributes_for :debtors

  validates :amount, :numericality => { :greater_than_or_equal_to => 0 }

  def expense_everyone
    User.all.each do |user|
      debtors.create(:user_id => user.id)
    end
  end

  def users_share(user)
    total_shares = 0
    my_share = 0
    debtors.each do |debtor|
      total_shares += debtor.user.share
      if debtor.user == user
        my_share = user.share
      end
    end
    share_ratio = my_share / total_shares
    return amount * share_ratio
  end

  #implement later
  def running_total
    return nil
  end

  def to_s
    "#{owner.to_s}: #{description}"
  end
end
