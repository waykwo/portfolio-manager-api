class FinancialAssetsController < ApplicationController
  require_relative '../services/stock_data_service'
  
  # def show_stock_data
  #   ticker = params[:ticker]
  #   stock_service = StockDataService.new(ticker)
    
  #   @stock_data = stock_service.get_cached_stock_data || stock_service.fetch_stock_data

  #   if @stock_data
  #     render json: @stock_data
  #   else
  #     render json: { error: 'Failed to fetch stock data' }, status: :service_unavailable
  #   end
  # end

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

    ticker = @financial_asset.ticker
    stock_service = StockDataService.new(ticker)

    @stock_data = stock_service.get_cached_stock_data || stock_service.fetch_stock_data

    p "=== HERE ==="
    puts @stock_data["values"][0]
    p "=== HERE ==="

    if @stock_data
      @financial_asset.update(
        name: params[:name] || @financial_asset.name,
        ticker: params[:ticker] || @financial_asset.ticker,
        description: params[:description] || @financial_asset.description,
        asset_class: params[:asset_class] || @financial_asset.asset_class,
        latest_price: @stock_data["values"][0]["close"]
        # latest_price: params[:latest_price] || @financial_asset.latest_price
      )
      render :show
    else
      render json: { error: 'Failed to fetch stock data' }, status: :service_unavailable
    end

  end

  def destroy
    @financial_asset = FinancialAsset.find_by(id: params[:id])
    @financial_asset.destroy
    render json: {message: "Asset destroyed successfully"}
  end

end
