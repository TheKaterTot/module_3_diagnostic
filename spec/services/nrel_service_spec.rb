require "rails_helper"

describe NrelService do
  let(:service) { NrelService.new }

  describe "#nearest_stations" do
    it "finds 10 closest stations" do
      VCR.use_cassette("services/find_nearest_stations") do
        stations = service.nearest_stations("80204")

        station = stations.first

        expect(stations.count).to eq(10)

      end
    end
  end
end
