class Journey

  attr_reader :entry_station, :exit_station

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


end
