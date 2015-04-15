class Users::SessionsController < Devise::SessionsController
  before_filter :configure_sign_in_params, only: [:create]
  skip_before_filter :is_authenticated_user, only: [:new, :create]

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

    @owned_debts = Debt.where(owner: current_user.id)
    @debts = Debt.joins(:debtors).where("debtors.user_id = ?", current_user.id)
  end

  protected

  # You can put the params you want to permit in the empty array.
  def configure_sign_in_params
    devise_parameter_sanitizer.for(:sign_in) << :username
  end
end
