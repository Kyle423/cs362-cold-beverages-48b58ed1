class WaterDispenser

  attr_reader :reservoir

  def initialize(reservoir)
    @reservoir = reservoir
  end

  def dispense(vessel)
    old_vol = reservoir.current_water_volume
    reservoir.drain(vessel.volume)
    vessel.fill(old_vol - reservoir.current_water_volume)
  end

end
