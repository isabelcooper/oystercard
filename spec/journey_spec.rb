require 'journey'

describe Journey do

  let(:station) { double(:station, zone: 1) }
  let(:station2) { double(:station, zone: 3) }

  describe '#entry_station' do
    it 'should return nil entry station when initialized without an argument' do
      expect(subject.entry_station).to eq  nil
    end

    it 'should update entry station' do
      subject.update_entry_station(station)
      expect(subject.entry_station).to eq station
    end
  end

  describe '#exit_station' do
    it 'should return nil exit station when initialized' do
      expect(subject.exit_station).to eq nil
    end

    it 'should update exit_station' do
      subject.update_exit_station(station)
      expect(subject.exit_station).to eq station
    end

  end

  describe '#fare_calculation' do

    it 'should calculate minimum fare if travelled in one zone' do
      subject.update_entry_station(station)
      subject.update_exit_station(station)
      subject.set_fare
      expect(subject.fare).to eq Journey::MINIMUM_FARE
    end

    it 'should calculate a penalty fare by default' do
      expect(subject.fare).to eq Journey::PENALTY_FARE
    end

    it 'should calculate a penalty fare if the user doesn\'t touch in' do
      subject.update_exit_station(station)
      subject.set_fare
      expect(subject.fare).to eq Journey::PENALTY_FARE
    end

    it 'should calculate a minimum fare if the user doesn\t touch out' do
      subject.update_entry_station(station)
      subject.set_fare
      expect(subject.fare).to eq Journey::PENALTY_FARE
    end

    it 'should calculate the fare between two zones' do
      subject.update_entry_station(station)
      subject.update_exit_station(station2)
      subject.set_fare
      expect(subject.fare).to eq 3
    end
  end

end
