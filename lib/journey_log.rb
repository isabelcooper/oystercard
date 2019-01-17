require_relative 'journey'

class JourneyLog

  attr_reader :current_journey, :journeys

  def initialize(current_journey = Journey)
    @current_journey = current_journey.new
    @journeys = []
  end

  def start_journey(station, journey = Journey)
    start_station(station)
  end

  def end_journey(station)
    exit_station(station)
  end

  def fare_calculation
    @current_journey.set_fare
  end

  def store
    @journeys << current_journey
  end

  def log_journey(journey = Journey)
    fare_calculation
    store
    reset(journey)
  end

  private

  def reset(journey)
    @current_journey = journey.new unless @current_journey.no_journey
  end

  def start_station(station)
    @current_journey.update_entry_station(station)
  end

  def exit_station(station)
    @current_journey.update_exit_station(station)
  end

end
