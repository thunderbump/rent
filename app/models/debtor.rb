class Debtor < ActiveRecord::Base
  belongs_to :user
  belongs_to :debt
end
