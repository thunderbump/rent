module PaymentsHelper
  include ActionView::Helpers::NumberHelper

  def description
    return "Payment from " + source.first_name +
      " to " + destination.first_name +
      " of " + number_to_currency(amount)
  end

end
