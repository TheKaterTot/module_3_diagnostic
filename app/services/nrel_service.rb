class NrelService
  attr_reader :client, :token

  def initialize(token, options={})
    @token = token
    @client = options.fetch(:client) do
      Faraday.new(url: "http://developer.nrel.gov/api")
    end
  end

  def nearest_stations(zip)
    parse(Faraday.get("http://developer.nrel.gov/api/alt-fuel-stations/v1/nearest.json?location=#{zip}&limit=10&api_key=#{token}")).map do |data|
     NrelStation.new(data)
   end

  end

  private

  def parse(response)
    JSON.parse(response.body)
  end
end
