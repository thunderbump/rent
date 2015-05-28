class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  respond_to :html

  def index
    @items = Item.all
    respond_with(@items)
  end

  def show
    respond_with(@item)
  end

  def new
    @item = Item.new
    respond_with(@item)
  end

  def edit
  end

  def create
    @item = Item.new(item_params)
    @item.save
    redirect_to root_path
    #respond_with(@item)
  end

  def update
    @item.update(item_params)
    respond_with(@item)
  end

  def destroy
    @item.destroy
    respond_with(@item)
  end

  def add_to_list
    @item = Item.find(params[:item_id])
    if params[:remove]
      @item.needed = false
    else
      @item.needed = true
    end

    if @item.save
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  #def store
  #  @items = Item.where(needed: true)
  #  @invoice = Invoice.find_or_create_by(owner_id: current_user.id, expensed: false)
  #end

  private
    def set_item
      @item = Item.find(params[:id])
    end

    def item_params
      params.require(:item).permit(:description, :item_id, :remove)
    end
end
