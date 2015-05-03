class Users::SessionsController < Devise::SessionsController
  before_filter :configure_sign_in_params, only: [:create]
  skip_before_filter :is_authenticated_user, only: [:new, :create]

  helper DashboardHelper

  # GET /resource/sign_in
  def new
    super
  end

  # POST /resource/sign_in
  def create
    super
  end

  # DELETE /resource/sign_out
  def destroy
    super
  end

  def dashboard
    @users = User.where("id NOT IN (:id)", id: current_user.id)
#    @history = (current_user.debts + 
#               Debt.where("owner_id = :id", id: current_user.id) +
#               Payment.where("source_id = :id", id: current_user.id) + 
#               Payment.where("destination_id = :id", id: current_user.id)
#               ).sort_by(&:created_at)
    @history = current_user.all_debts_and_payments
    @payments_pending = Payment.where(destination: current_user.id).where(accepted: false)
    @test = current_user.all_debts
  end

  protected

  # You can put the params you want to permit in the empty array.
  def configure_sign_in_params
    devise_parameter_sanitizer.for(:sign_in) << :username
  end
end
