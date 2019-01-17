require 'journey_log'

describe JourneyLog do
  let(:station) { double(:station) }
  let(:current_journey) { double(:journey, update_entry_station: station, update_exit_station: station, set_fare: 1, no_journey: false) }
  let(:journey_class) { double(:current_journey, new: current_journey) }
  let(:journey_class_new) { double(:current_journey, new: current_journey) }
  let(:journey_log) { JourneyLog.new(journey_class) }

  describe '#start_journey' do
    # it 'should store the start of a new journey' do
    #   expect(current_journey).to receive(:update_entry_station)
    #   journey_log.start_station(station)
    # end

    it 'should store the start of a new journey' do
      expect(current_journey).to receive(:update_entry_station)
      journey_log.start_journey(station,journey_class_new)
    end

    it 'should reset current_journey' do
      journey_log.start_journey(station)
      expect(journey_log.current_journey).to_not equal(current_journey)
    end

    it 'should receive the message set_fare' do
      expect(current_journey).to receive(:set_fare)
      journey_log.fare_calculation
    end
  end

  describe '#end_journey' do
    it 'should store the end of a new journey' do
      expect(current_journey).to receive(:update_exit_station)
      journey_log.end_journey(station)
    end

    it 'should store a journey in journeys' do
      journey_log.store
      expect(journey_log.journeys).to include(current_journey)
    end
  end
end
