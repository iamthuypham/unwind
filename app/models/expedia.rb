require 'json'

class Expedia
  include HTTParty
  base_uri 'terminal2.expedia.com/x'
  format :json
  
  def initialize(latitude, longitude, check_in_date, check_out_date)
    expedia_api_key = Figaro.env.expedia_apikey 
    @options = { query: {city: 'Seattle', latitude: latitude, longitude: longitude, checkInDate: check_in_date, checkOutDate: check_out_date, room1: 2,resultsPerPage: 10, apikey: expedia_api_key} }
  end
  
  def hotel_search
    self.class.get("/mhotels/search", @options)
  end
  
end