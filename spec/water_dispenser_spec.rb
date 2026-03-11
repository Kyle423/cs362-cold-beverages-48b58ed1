require_relative '../lib/water_dispenser'

describe 'A water dispenser' do

  let(:reservoir) { WaterReservoir.new(200, 150) }
  let(:dispenser) { WaterDispenser.new(reservoir) }

  it 'has a reservoir' do
    expect(dispenser.reservoir).to eq(reservoir)
  end

  it 'dispenses' do
    vessel = Vessel.new('FAKE', 100)
    dispenser.dispense(vessel)
    expect(dispenser.reservoir.current_water_volume).to eq(50)
  end

  it 'cannot dispense below 0' do
    vessel = Vessel.new('FAKE', 200)
    dispenser.dispense(vessel)
    expect(dispenser.reservoir.current_water_volume).to eq(0)
  end

  it 'fills the vessel full' do
    vessel = Vessel.new('FAKE', 100)
    dispenser.dispense(vessel)
    expect(vessel.current_volume).to eq(vessel.volume)
  end

  it 'fills the vessel a little' do
    vessel = Vessel.new('FAKE', 200)
    dispenser.dispense(vessel)
    expect(vessel.current_volume).to eq(150)
  end

end
