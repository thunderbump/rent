class PaymentsController < ApplicationController
  before_action :set_payment, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @payments = Payment.all
    respond_with(@payments)
  end

  def show
    respond_with(@payment)
  end

  def new
    @payment = Payment.new
    @users = User.all
    respond_with(@payment)
  end

  def edit
    @users = User.all
  end

  def create
    @payment = Payment.new(payment_params)
    #if current_user.id == payment_params[:destination_id].to_i
    if payment_params[:creator_id].to_i == payment_params[:destination_id].to_i
      @payment.accepted = true
    else
      @payment.accepted = false
    end

    if @payment.save
      respond_with(@payment)
    else
      @users = User.all
      render 'payments/new'
    end
  end

  def update
    @payment.update(payment_params)
    respond_with(@payment)
  end

  def destroy
    @payment.destroy
    respond_with(@payment)
  end

  private
    def set_payment
      @payment = Payment.find(params[:id])
    end

    def payment_params
      params.require(:payment).permit(:amount, :source_id, :destination_id, :creator_id, :accepted)
    end
end
