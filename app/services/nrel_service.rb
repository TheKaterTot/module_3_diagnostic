class NrelService
  attr_reader :client, :token

  def initialize(token, options={})
    @token = token
  end

  def nearest_stations(zip)
    parse(Faraday.get("http://developer.nrel.gov/api/alt-fuel-stations/v1/nearest.json?location=#{zip}&radius=6.0&api_key=#{token}")).map do |data|
      NrelStation.new(data)
    end

  end

  private

  def parse(response)
    JSON.parse(response.body)
  end
end
