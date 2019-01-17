require 'oystercard'

describe Oystercard do

  let(:station) { double :station, zone: 1 }
  let(:exit_station) { double :exit_station }
  let(:journeylog) { double(:journeylog, no_journey: true, log_journey: nil, last_fare: 1, start_journey: station, end_journey: station ) }
  let(:journey_log_class) {double(:journey_log_class, new: journeylog)}
  let(:subject) { Oystercard.new(journey_log_class) }


  describe '#balance' do

    it "has a 0 balance when a new card is initialized" do
      expect(subject.balance).to eq 0
    end

    it "should deduct the previous journey fare from the card balance" do
      subject.top_up(10)
      subject.touch_in(station)
      puts subject.balance
      subject.touch_out(station)
      expect(subject.balance).to eq 9
    end

  end

  describe '#top_up' do

    it "will raise an error if the user tries to top up the card beyond a limit" do
      expect{ subject.top_up((Oystercard::LIMIT) + 1) }.to raise_error "This exceeds the £#{Oystercard::LIMIT} limit"
    end

    it "amends the card balance when the top up method is called" do
      subject.top_up(10)
      expect(subject.balance).to eq 10
    end

  end

  describe '#touch_in' do

    it "will raise and error if the user tried to touch in with insufficient funds on the card" do
      expect{ subject.touch_in(station) }.to raise_error "Can\'t start journey: insufficient funds"
    end

  end

end
