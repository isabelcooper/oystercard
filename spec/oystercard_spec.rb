require 'oystercard'

describe Oystercard do

  let(:station) { double :station }
  let(:exit_station) { double :exit_station }
  # let(:topped_up_card) { Oystercard.new.top_up(10) }

  it "has a 0 balance when a new card is initialized" do
    expect(subject.balance).to eq 0
  end

  it "amends the card balance when the top up method is called" do
    subject.top_up(10)
    expect(subject.balance).to eq 10
  end

  it "will raise an error if the user tries to top up the card beyond a limit" do
    expect{ subject.top_up((Oystercard::LIMIT) + 1) }.to raise_error "This exceeds the £#{Oystercard::LIMIT} limit"
  end

  it "will raise and error if the user tried to touch in with insufficient funds on the card" do
    expect{ subject.touch_in(station) }.to raise_error "Can\'t start journey: insufficient funds"
  end

  it "will raise an error if user tries to touch out without touching in first" do
    subject.top_up(10)
    expect{ subject.touch_out(2, station)}.to raise_error "Can\'t touch out without touching in first"
  end

  it "will raise an error if user tries to touch in and the card is already in use" do
    subject.top_up(10)
    subject.touch_in(station)
    expect{ subject.touch_in(station) }.to raise_error "Can\'t touch in: card already in use"
  end

  it "should deduct a fare from the card balance when the touch_out method is called" do
    subject.top_up(10)
    subject.touch_in(station)
    subject.touch_out(2,station)
    expect(subject.balance).to eq 8
  end

  it 'will initialize with an empty journeys array' do
    expect(subject.journeys).to eq []
  end

  it "will add single_journey to a 'journeys' array when touching out" do
    subject.top_up(10)
    subject.touch_in(station)
    subject.touch_out(2, exit_station)
    expect(subject.journeys[0]).to include(:entry => station, :exit => exit_station)
  end

end
