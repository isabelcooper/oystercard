class Journey

  attr_reader :entry_station, :exit_station

  MINIMUM_FARE = 1
  PENALTY_FARE = 6

  def initialize
    @entry_station
    @exit_station
  end

  def update_exit_station(station)
    @exit_station = station
  end

  def update_entry_station(station)
    @entry_station = station
  end

  def fare
    entry_station != nil && exit_station != nil ? MINIMUM_FARE : PENALTY_FARE
  end

end