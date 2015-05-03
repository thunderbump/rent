module DashboardHelper
  #tally up what the payer owes the biller
  #def current_bill(biller)
  #  payer_debts = Debt.joins(:debtors).where("debtors.user_id = ?", current_user.id
  #                                    ).where(owner_id: biller.id
  #                                    ).map { |p| p.users_share(current_user) }
  #  biller_debts = Debt.joins(:debtors).where("debtors.user_id = ?", biller.id
  #                                    ).where(owner_id: current_user.id
  #                                    ).map { |p| p.users_share(biller) }
  #  payer_payments = Payment.where(source_id: current_user.id
  #                         ).where(destination_id: biller.id
  #                         ).map { |p| p.users_share(current_user) }
  #  biller_payments = Payment.where(source_id: biller.id
  #                          ).where(destination_id: current_user.id
  #                          ).map { |p| p.users_share(biller) }
#
  #  payer_debts.sum - biller_debts.sum + payer_payments.sum - biller_payments.sum
  #end

  #def history
  #end
    

  #def all_debts
  #  payer_debts = Debt.joins(:debtors).where("debtors.user_id = ?", current_user.id
  #                                   ).where(owner_id: biller.id
  #                                   ).map { |p| p.users_share(current_user) }
  #  biller_debts = Debt.joins(:debtors).where("debtors.user_id = ?", biller.id
  #                                    ).where(owner_id: current_user.id
  #                                    ).map { |p| p.users_share(biller) }
  #  payer_payments = Payment.where(source_id: current_user.id
  #                         ).where(destination_id: biller.id
  #                         ).map { |p| p.users_share(current_user) }
  #  biller_payments = Payment.where(source_id: biller.id
  #                          ).where(destination_id: current_user.id
  #                          ).map { |p| p.users_share(biller) }
  #end
end
