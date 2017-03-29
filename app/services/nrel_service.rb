class NrelService

  def initialize(token)
    @token = token
  end

  def nearest_stations(zip)
    Faraday.get("http://developer.nrel.gov/api/alt-fuel-stations/v1/nearest.json?location=#{zip}&limit=10")
  end

  private
  def client_url
    Faraday.get("http://developer.nrel.gov/api/alt-fuel-stations/v1")
  end
end
