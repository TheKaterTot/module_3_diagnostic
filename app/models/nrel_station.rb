class NrelStation
  attr_reader :data

  def initialize(data)
    @data = data
  end

  def name
    data["fuel_stations"]["station_name"]
  end

end
