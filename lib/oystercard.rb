class Oystercard

  attr_reader :balance, :entry_station, :journeys

  LIMIT = 90
  MIN_BALANCE = 1

  def initialize
    @balance = 0
    @journeys = []
    @single_journey = {:entry => nil, :exit => nil }
  end

  def top_up(value)
    limit_exceeded?(value)
    @balance += value
  end

  def touch_in(station)
    fail "Can\'t touch in: card already in use" if @single_journey[:entry] != nil
    sufficient_funds?
    @single_journey[:entry] = station
  end

  def touch_out(fare, station)
    fail "Can\'t touch out without touching in first" if  @single_journey[:entry] == nil
    deduct(fare)
    @single_journey[:exit] = station
    @journeys << @single_journey
    reset_journey
  end

  private

  def deduct(fare)
    @balance -= fare
  end

  def limit_exceeded?(value)
    fail "This exceeds the £#{LIMIT} limit" if balance + value > LIMIT
  end

  def sufficient_funds?
    fail "Can\'t start journey: insufficient funds" if balance <= MIN_BALANCE
  end

  def reset_journey
    @single_journey = {:entry => nil, :exit => nil }
  end

end
