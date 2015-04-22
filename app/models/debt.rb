class Debt < ActiveRecord::Base
  belongs_to :owner, class_name: "User"
  has_many :debtors
  has_many :users, through: :debtors

  accepts_nested_attributes_for :debtors

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

end
