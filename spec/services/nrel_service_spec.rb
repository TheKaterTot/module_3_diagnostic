require "rails_helper"

describe NrelService do
  let(:service) { NrelService.new }

  describe "#nearest_stations" do
    it "finds 10 closest stations" do
      VCR.use_cassette("services/find_nearest_stations") do
        stations = services.nearest_stations("80204")

        station = stations.first
      end
    end
  end
end
