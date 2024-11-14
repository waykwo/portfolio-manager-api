class StockDataService
  require 'net/http'

  def initialize(ticker)
    @ticker = ticker
    @cache_key = "stock_data_#{ticker}"
  end

  def fetch_stock_data
    Rails.cache.fetch(@cache_key, expires_in: 1.hour) do
      fetch_stock_data_from_api
    end
  end

  def get_cached_stock_data
    Rails.cache.read(@cache_key)
  end

  # private

  def fetch_stock_data_from_api
    uri = URI("https://twelve-data1.p.rapidapi.com/time_series?outputsize=30&symbol=#{@ticker}&interval=1day&format=json")
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true if uri.scheme == 'https'

    request = Net::HTTP::Get.new(uri.request_uri)
    
    # Set headers
    request['x-rapidapi-host'] = 'twelve-data1.p.rapidapi.com'
    request['x-rapidapi-key'] = Rails.application.credentials[:rapidapi_key]
    
    response = http.request(request)
    JSON.parse(response.body) if response.is_a?(Net::HTTPSuccess)
  end
end
