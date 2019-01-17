require_relative 'journey'
require_relative 'journey_log'
require_relative 'station'

class Oystercard

  attr_reader :balance, :journeylog

  LIMIT = 90
  MIN_BALANCE = 1

  def initialize(journeylog = JourneyLog)
    @balance = 0
    @journeylog = journeylog.new
  end

  def top_up(value)
    limit_exceeded?(value)
    @balance += value
  end

  def touch_in(station)
    log_previous_journey unless journeylog.no_journey
    sufficient_funds?
    @journeylog.start_journey(station)
  end

  def touch_out(station)
    @journeylog.end_journey(station)
    log_previous_journey
  end

  private

  def log_previous_journey
    @journeylog.log_journey
    deduct(@journeylog.last_fare)
  end

  def deduct(fare)
    @balance -= fare
  end

  def limit_exceeded?(value)
    fail "This exceeds the £#{LIMIT} limit" if balance + value > LIMIT
  end

  def sufficient_funds?
    fail "Can't start journey: insufficient funds" if balance <= MIN_BALANCE
  end

end
