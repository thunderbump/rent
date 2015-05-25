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
    @invoice.save
    respond_with(@invoice)
  end

  def update
    @invoice.update(invoice_params)
    respond_with(@invoice)
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
    @invoice = Invoice.find(params[:invoice_id])
    @item = Item.find(params[:item_id])
    if @invoice.items.pluck(:id).include? @item.id
      @invoice.items.delete(@item)
    else
      LineItem.create(invoice_id: @invoice.id, item_id: @item.id).save
    end

    respond_to do |format|
      format.json
    end
  end

  private
    def set_invoice
      @invoice = Invoice.find(params[:id])
    end

    def invoice_params
      params.require(:invoice).permit(:description)#, :invoice_id, :item_id)
    end
end
