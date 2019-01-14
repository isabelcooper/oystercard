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

end
