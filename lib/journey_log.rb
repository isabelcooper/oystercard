require_relative 'journey'

class JourneyLog

  attr_reader :single_journey, :journeys

  def initialize(single_journey = Journey)
    @single_journey = single_journey.new
    @journeys = []
  end

  def start_journey(station)
    start_station(station)
    store
    reset
  end

  def start_station(station)
    @single_journey.update_entry_station(station)
  end

  def exit_station(station)
    @single_journey.update_exit_station(station)
  end

  private
  def store
    @journeys << single_journey
  end

  def reset
    @single_journey = Journey.new
  end

end
