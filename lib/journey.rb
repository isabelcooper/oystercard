class Journey

  attr_reader :entry_station, :exit_station, :fare

  MINIMUM_FARE = 1
  PENALTY_FARE = 6

  def initialize
    @entry_station
    @exit_station
    @fare = PENALTY_FARE
  end

  def update_exit_station(station)
    @exit_station = station
  end

  def update_entry_station(station)
    @entry_station = station
  end

  def set_fare
  #  no_journey ? @fare = 0 : @fare = fare_calculator
   @fare = fare_calculator unless no_journey
  end

  def no_journey
    entry_station == nil && exit_station == nil
  end

  # def incomplete
  #  ( entry_station == nil || exit_station == nil ) && ( entry_station != exit_station )
  # end

  private

  def complete
    entry_station != nil && exit_station != nil
  end

  def fare_calculator
    complete ? MINIMUM_FARE : PENALTY_FARE
  end

end
