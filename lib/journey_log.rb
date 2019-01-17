require_relative 'journey'

class JourneyLog

  attr_reader :current_journey, :journeys

  def initialize(current_journey = Journey)
    @current_journey = current_journey.new
    @journeys = []
  end

  def start_journey(station)
    @current_journey.update_entry_station(station)
  end

  def end_journey(station)
    @current_journey.update_exit_station(station)
  end

  def log_journey(journey = Journey)
    fare_calculation
    store
    reset(journey)
  end

  def no_journey
    @current_journey.no_journey
  end

  def last_fare
    @journeys.last.fare
  end

  private

  def fare_calculation
    @current_journey.set_fare
  end

  def store
    @journeys << current_journey
  end

  def reset(journey)
    @current_journey = journey.new unless @current_journey.no_journey
  end

end
