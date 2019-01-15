require 'journey'

describe Journey do

  let(:station) { double(:station) }

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

    it 'should calculate a minimum fare if the user touches in and out' do
      subject.update_entry_station(station)
      subject.update_exit_station(station)
      expect(subject.fare).to eq Journey::MINIMUM_FARE
    end

    it 'should calculate a penalty fare if the user doesn\'t touch in' do
      subject.update_exit_station(station)
      expect(subject.fare).to eq Journey::PENALTY_FARE
    end

    it 'should calculate a minimum fare if the user doesn\t touch out' do
      subject.update_entry_station(station)
      expect(subject.fare).to eq Journey::PENALTY_FARE
    end

  end

end
