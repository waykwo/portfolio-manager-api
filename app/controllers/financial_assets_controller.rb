class FinancialAssetsController < ApplicationController
  def index
    @financial_assets = FinancialAsset.all
    render :index
  end

  def show
    @financial_asset = FinancialAsset.find_by(id: params[:id])
    render :show
  end

  def create
    @financial_asset = FinancialAsset.new(
      name: params[:name],
      ticker: params[:ticker],
      description: params[:description],
      asset_class: params[:asset_class],
      latest_price: params[:latest_price]
    )
    # @financial_asset.save
    # render :show

    if @financial_asset.save
      render :show
    else
      render json: {message: "Asset was not created. Is the ticker unique?"}
    end
  end

  def update
    @financial_asset = FinancialAsset.find_by(id: params[:id])
    @financial_asset.update(
      name: params[:name] || @financial_asset.name,
      ticker: params[:ticker] || @financial_asset.ticker,
      description: params[:description] || @financial_asset.description,
      asset_class: params[:asset_class] || @financial_asset.asset_class,
      latest_price: params[:latest_price] || @financial_asset.latest_price
    )
    render :show
  end

  def destroy
    @financial_asset = FinancialAsset.find_by(id: params[:id])
    @financial_asset.destroy
    render json: {message: "Asset destroyed successfully"}
  end

end
