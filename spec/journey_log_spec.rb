require 'journey_log'
require 'journey'

describe JourneyLog do
  let(:station) { double(:station) }

  it 'should store the start of a new journey' do
    subject.start_station(station)
    expect(subject.journey.entry_station).to eq(station)
  end

end
