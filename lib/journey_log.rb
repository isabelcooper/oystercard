require_relative 'journey'

class JourneyLog

  attr_reader :journey

  def initialize(journey = Journey.new)
    @journey = journey
    @log = []
  end

  def start_station(station)
    journey.update_entry_station(station)
  end

end
