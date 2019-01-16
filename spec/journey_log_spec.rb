require 'journey_log'

describe JourneyLog do
  let(:station) { double(:station) }
  let(:single_journey) { double(:journey, update_entry_station: station, update_exit_station: station) }
  let(:journey_class) { double(:single_journey, new: single_journey) }
  let(:journey_log) { JourneyLog.new(journey_class) }

  describe '#start_journey' do
    it 'should store the start of a new journey' do
      expect(single_journey).to receive(:update_entry_station)
      journey_log.start_station(station)
    end

    it 'should store a journey in journeys' do
      journey_log.start_journey(station)
      expect(journey_log.journeys).to include(single_journey)
    end

    it 'should reset single_journey' do
      journey_log.start_journey(station)
      expect(journey_log.single_journey).to_not equal(single_journey)
    end
  end

  it 'should store the end of a new journey' do
    expect(single_journey).to receive(:update_exit_station)
    journey_log.exit_station(station)
  end

end