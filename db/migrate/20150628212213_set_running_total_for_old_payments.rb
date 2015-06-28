class SetRunningTotalForOldPayments < ActiveRecord::Migration
  def change
    Payment.all.each do |payment|
      payment.running_total = payment.source.current_bill_before_date_with(payment.destination, payment.created_at)
      payment.save
    end
  end
end
