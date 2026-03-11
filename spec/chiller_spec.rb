require_relative '../lib/chiller'

describe 'A chiller' do

  let(:chiller) { Chiller.new }

  it 'has a capacity and temperature' do
    expect(chiller.capacity).to eq(100)
    expect(chiller.temperature).to eq(70)
  end

  it 'can add an item' do
    item = Item.new('FAKE', 100)
    old_cap = chiller.remaining_capacity
    chiller.add(item)
    expect(chiller.remaining_capacity).to_not eq(old_cap)
  end

  it 'can check capacity' do
    expect(chiller.remaining_capacity).to eq(100)
  end

  it 'can set level' do
    chiller.set_level(5)
    expect(chiller.temperature).to eq(45)
  end

end
