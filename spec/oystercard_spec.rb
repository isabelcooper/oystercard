require 'oystercard'

describe Oystercard do

  it "has a 0 balance when a new card is initialized" do
    expect(subject.balance).to eq 0
  end

  it "amends the card balance when the top up method is called" do
    subject.top_up(10)
    expect(subject.balance).to eq 10
  end

  it "will raise an error if the user tries to top up the card beyond a limit" do
    expect{ subject.top_up(subject.limit + 1) }.to raise_error "This exceeds the £#{subject.limit} limit"
  end

  it "should deduct a fare from the card balance when the deduct menthod is called" do
    subject.top_up(10)
    subject.deduct(2)
    expect(subject.balance).to eq 8
  end

  it "will have an in_journey? status of false when a card is initialized" do
    expect(subject.in_journey?).to eq false
  end

  it "will change the status of @in_journey to true when the touch_in method is called" do
    subject.touch_in
    expect(subject.in_journey?).to eq true
  end

  it "will change the status of @in_journey to false when the touch_out method is called" do
    subject.touch_out
    expect(subject.in_journey?).to eq false
  end

end
