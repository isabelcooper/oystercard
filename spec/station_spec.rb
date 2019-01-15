require 'station'

describe Station do

  it "should tell me what zone it is in" do
    station = Station.new(1, "Old Street")
    expect(station.zone).to eq 1
  end

  it "should have name associated with it" do
    station = Station.new(1, "Old Street")
    expect(station.name).to eq "Old Street"
  end

end
