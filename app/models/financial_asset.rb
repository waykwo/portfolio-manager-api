class FinancialAsset < ApplicationRecord
  validates :ticker, presence: true, uniqueness: true
  has_many :transactions
  # has_one :transaction

  # require "http"
  
  # def asset_data
  #   alpha_vantage_data = HTTP.get("https://www.alphavantage.co/query?function=TIME_SERIES_INTRADAY&symbol=IBM&interval=5min&apikey=#{Rails.application.credentials[:alpha_vantage_key]}")
  #   # render json: alpha_vantage_data.parse(:json)
  #   return alpha_vantage_data.parse(:json)
  #   p alpha_vantage_data.parse(:json)["Time Series (5min)"].first[1]
  # end
  

  # def fetch_stock(ticker)
  #   # ticker = params[:ticker]
  #   cache_key = "stock_data_#{ticker}"

  #   @stock_data = Rails.cache.fetch(cache_key, expires_in: 24.hours) do
  #     fetch_stock_data_from_api(ticker)
  #   end

  #   if @stock_data
  #     render json: @stock_data
  #   else
  #     render json: { error: "Failed to fetch stock data" }, status: :service_unavailable
  #   end
  # end

  # # private

  # def fetch_stock_data_from_api(ticker)
  #   uri = URI("https://twelve-data1.p.rapidapi.com/time_series?outputsize=30&symbol=#{ticker}&interval=1day&format=json")
  #   response = Net::HTTP.get_response(uri)
  #   JSON.parse(response.body) if response.is_a?(Net::HTTPSuccess)
  # end


end
