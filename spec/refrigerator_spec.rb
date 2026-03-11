require_relative '../lib/refrigerator'

describe 'A refrigerator' do

  let(:freezer) { Freezer.new }
  let(:chiller) { Chiller.new }
  let(:reservoir) { WaterReservoir.new }
  let(:dispenser) { WaterDispenser.new(reservoir) }
  let(:refrigerator) { Refrigerator.new(chiller, freezer, dispenser, reservoir) }

  it 'has a chiller, freezer, water_dispenser, and water_reservoir' do
    expect(refrigerator.freezer).to eq(freezer)
    expect(refrigerator.chiller).to eq(chiller)
    expect(refrigerator.water_dispenser).to eq(dispenser)
    expect(refrigerator.water_reservoir).to eq(reservoir)
  end

  it 'can add an item to the chiller' do
    item = Item.new('FAKE', 100)
    old_cap = chiller.remaining_capacity
    refrigerator.chill(item)
    expect(chiller.remaining_capacity).to_not eq(old_cap)
  end

  it 'can add an item to the freezer' do
    item = Item.new('FAKE', 100)
    old_cap = freezer.remaining_capacity
    refrigerator.freeze(item)
    expect(freezer.remaining_capacity).to_not eq(old_cap)
  end

  it 'can get the total capacity' do
    expect(refrigerator.total_capacity).to eq(chiller.capacity + freezer.capacity)
  end

  it 'can get the remaining capaity' do
    expect(refrigerator.total_capacity).to eq(chiller.remaining_capacity + freezer.remaining_capacity)
  end

  it 'can set chiller level' do
    refrigerator.set_chiller_level(5)
    expect(chiller.temperature).to eq(45)
  end

  it 'can set freezer level' do
    refrigerator.set_freezer_level(5)
    expect(freezer.temperature).to eq(20)
  end

  it 'can output its information as a string' do
    expect(refrigerator.to_s).to eq('Power: off
Storage: 200 of 200 available
Temps: Chiller is 70, Freezer is 70
Water: Reservoir has 0 remaining.
')
  end

end
