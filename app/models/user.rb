class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable

  has_many :debtors
  has_many :debts, through: :debtors

  def current_bill_with(user)
    payer_debts = Debt.joins(:debtors).where("debtors.user_id = ?", id
                                     ).where(owner_id: user.id
                                     ).map { |p| p.users_share(self) }
    biller_debts = Debt.joins(:debtors).where("debtors.user_id = ?", user.id
                                      ).where(owner_id: id
                                      ).map { |p| p.users_share(user) }
    payer_payments = Payment.where(source_id: id
                           ).where(destination_id: user.id
                           ).where(accepted: true
                           ).map { |p| p.users_share(self) }
    biller_payments = Payment.where(source_id: user.id
                            ).where(destination_id: id
                            ).where(accepted: true
                            ).map { |p| p.users_share(user) }

    payer_debts.sum - biller_debts.sum + payer_payments.sum - biller_payments.sum
  end

  def current_bill_before_date_with(user, date)
    payer_debts = Debt.joins(:debtors).where("debtors.user_id = ?", id
                                     ).where(owner_id: user.id
                                     ).where("debts.created_at <= ?", date
                                     ).map { |p| p.users_share(self) }
    biller_debts = Debt.joins(:debtors).where("debtors.user_id = ?", user.id
                                      ).where(owner_id: id
                                      ).where("debts.created_at <= ?", date
                                      ).map { |p| p.users_share(user) }
    payer_payments = Payment.where(source_id: id
                           ).where(destination_id: user.id
                           ).where(accepted: true
                           ).where("payments.created_at <= ?", date
                           ).map { |p| p.users_share(self) }
    biller_payments = Payment.where(source_id: user.id
                            ).where(destination_id: id
                            ).where(accepted: true
                            ).where("payments.created_at <= ?", date
                            ).map { |p| p.users_share(user) }

    payer_debts.sum - biller_debts.sum + payer_payments.sum - biller_payments.sum
  end

  def all_debts
    (debts + Debt.where("owner_id = :id", id: id)
    ).sort_by(&:created_at)
  end

  def debts_involving(target)
    (Debt.joins(:debtors).where("debtors.user_id = ?", id
                               ).where(owner_id: target.id) +
    Debt.joins(:debtors).where("debtors.user_id = ?", target.id
                              ).where(owner_id: id)
    ).sort_by(&:created_at)
  end

  def all_payments
    (Payment.where("source_id = :id", id: id) +
     Payment.where("destination_id = :id", id: id)
    ).sort_by(&:created_at)
  end

  def payments_involving(target)
    Payment.where(source_id: id).where(destination_id: target.id) +
      Payment.where(source_id: target.id).where(destination_id: id
                                               ).sort_by(&:created_at)
  end

  def all_debts_and_payments
    (all_debts + all_payments).sort_by(&:created_at)
  end

  def debts_and_payments_involving(target)
    (debts_involving(target) + payments_involving(target)
    ).sort_by(&:created_at)
  end

  def to_s
    "#{first_name} #{last_name}"
  end
end
