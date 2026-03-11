require_relative '../lib/water_reservoir'

describe 'A water reservoir' do

  let(:reservoir) { WaterReservoir.new }

  it 'has a capacity and current_water_volume' do
    expect(reservoir.capacity).to eq(10)
    expect(reservoir.current_water_volume).to eq(0)
  end

  it 'is empty initially' do
    expect(reservoir.empty?)
  end

  it 'is not empty initially if set' do
    reservoir = WaterReservoir.new(initial_water_volume=5)
    expect(!reservoir.empty?)
  end

  it 'can be filled' do
    reservoir.fill
    expect(reservoir.current_water_volume).to eq(reservoir.capacity)
  end
  
  it 'can be drained' do
    reservoir.fill
    reservoir.drain(5)
    expect(reservoir.current_water_volume).to eq(5)
  end

  it 'cannot be drained below 0' do
    reservoir.drain(5)
    expect(reservoir.current_water_volume).to eq(0)
  end

end
