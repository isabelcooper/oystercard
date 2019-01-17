require_relative 'journey'

class JourneyLog

  attr_reader :single_journey, :journeys

  def initialize(single_journey = Journey)
    @single_journey = single_journey.new
    @journeys = []
  end

  def start_journey(station, journey = Journey)
    fare_calculation
    reset(journey)
    start_station(station)
  end

  def end_journey(station)
    exit_station(station)
    fare_calculation
    store
  end

  private
  def store
    @journeys << single_journey
  end

  def reset(journey)
    @single_journey = journey.new unless @single_journey.no_journey
  end

  def start_station(station)
    @single_journey.update_entry_station(station)
  end

  def exit_station(station)
    @single_journey.update_exit_station(station)
  end

  def fare_calculation
    @single_journey.set_fare
  end

end
