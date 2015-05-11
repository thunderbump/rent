class DebtsController < ApplicationController
  #tmp, delete after initial dashboards
  def index
    @debts = Debt.all
  end

  def new
    @debt = Debt.new
  end

  def show
    @debt = Debt.find(params[:id])
  end

  def create
    @debt = Debt.new(debt_params)
    @debt.owner = current_user
    @debt.save
    debt_params[:user_ids].each do |uid|
      if integer? uid
        @debt.debtors.create(:user_id => uid)
      end
    end
    redirect_to debts_path
  end

  def edit
    @debt = Debt.find(params[:id])
    if @debt.owner.id != current_user.id
      redirect_to dashboard_sessions_path
    end
  end

  def update
    @debt = Debt.find(params[:id])
    if @debt.update(debt_params)
      redirect_to debts_path
    else
      render edit
    end
  end

  def destroy
    @debt = Debt.find(params[:id])
    @debt.debtors.each do |debtor|
      debtor.destroy
    end
    @debt.destroy
    redirect_to debts_path
  end


  private
  def debt_params
    params.require(:debt).permit(:amount, 
                                 :description, 
                                 :user_ids => []
                                )
  end
  
  def integer?(test)
    return true if self =~ /\A\d+\Z/
    return false
  end

end
