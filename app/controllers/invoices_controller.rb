class InvoicesController < ApplicationController
  before_action :set_invoice, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @invoices = Invoice.all
    respond_with(@invoices)
  end

  def show
    respond_with(@invoice)
  end

  def new
    @invoice = Invoice.new
    respond_with(@invoice)
  end

  def edit
  end

  def create
    @invoice = Invoice.new(invoice_params)
    @invoice.expensed = false
    @invoice.save
    respond_with(@invoice)
  end

  def update
    if params[:cost]
      @debt = Debt.create(description: "Store trip", amount: params[:cost], owner_id: current_user.id)
      @debt.save
      @debt.expense_everyone

      @invoice.expensed = true
      @invoice.debt_id = @debt.id

      @invoice.items.each do |item|
        item.needed = false
      end

      @invoice.save

      redirect_to root_path
    else
      @invoice.update(invoice_params)
      respond_with(@invoice)
    end
  end

  def destroy
    @invoice.destroy
    respond_with(@invoice)
  end

  #  def add_item_to_invoice
  #    @invoice = Invoice.find(params[:invoice_id])
  #    @item = Item.find(params[:item_id])
  #    LineItem.find_or_create_by(invoice_id: @invoice.id, item_id: @item.id).save
  #    respond_to do |format|
  #      format.js
  #    end
  #  end

  #  def add_item_to_invoice
  def toggle_item_in_invoice
    #@invoice = Invoice.find(params[:invoice_id])
    @invoice = Invoice.where(owner_id: current_user.id, expensed: false).first
    @item = Item.find(params[:item_id])
    @selected
    if @invoice.items.pluck(:id).include? @item.id
      @invoice.items.delete(@item)
      @selected = false
    else
      LineItem.create(invoice_id: @invoice.id, item_id: @item.id).save
      @selected = true
    end

    respond_to do |format|
      format.json
    end
  end

  def store
    @items = Item.where(needed: true)
    @invoice = Invoice.find_or_create_by(owner_id: current_user.id, expensed: false)
  end


  private
  def set_invoice
    @invoice = Invoice.find(params[:id])
  end

  def invoice_params
    params.require(:invoice).permit(:description)#, :invoice_id, :item_id)
  end
end
