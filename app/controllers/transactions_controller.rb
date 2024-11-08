class TransactionsController < ApplicationController
  def index
    @transactions = Transaction.all
    render :index
  end

  def show
    @transaction = Transaction.find_by(id: params[:id])
    render :show
  end

  def create
    @transaction = Transaction.new(
      user_id: params[:user_id],
      asset_id: params[:asset_id],
      shares: params[:shares],
      cost_per_share: params[:cost_per_share],
      trade_date: params[:trade_date]
    )
    @transaction.save
    render :show
  end

  def update
    @transaction = Transaction.find_by(id: params[:id])
    @transaction.update(
      shares: params[:shares] || @transaction.shares,
      cost_per_share: params[:cost_per_share] || @transaction.cost_per_share,
      trade_date: params[:trade_date] || @transaction.trade_date
    )
    render :show
  end

end
