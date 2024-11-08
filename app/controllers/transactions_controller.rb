class TransactionsController < ApplicationController
  def index
    @transactions = Transaction.where(user_id: current_user.id)
    render :index
  end

  def show
    @transaction = Transaction.find_by(id: params[:id])
    if @transaction.user_id == current_user.id
      render :show
    else
      render json: {}, status: :unauthorized
    end
  end

  def create
    @transaction = Transaction.new(
      user_id: current_user.id,
      financial_asset_id: params[:financial_asset_id],
      shares: params[:shares],
      cost_per_share: params[:cost_per_share],
      trade_date: params[:trade_date]
    )
    @transaction.save
    render :show
  end

  def update
    @transaction = Transaction.find_by(id: params[:id])
    if @transaction.user_id == current_user.id
      @transaction.update(
        shares: params[:shares] || @transaction.shares,
        cost_per_share: params[:cost_per_share] || @transaction.cost_per_share,
        trade_date: params[:trade_date] || @transaction.trade_date
      )
      render :show
    else
      render json: {}, status: :unauthorized
    end
  end

end
