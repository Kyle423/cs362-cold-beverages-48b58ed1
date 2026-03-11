require_relative '../lib/freezer'

describe 'A freezer' do

  let(:freezer) { Freezer.new }

  it 'has a capacity and temperature' do
    expect(freezer.capacity).to eq(100)
    expect(freezer.temperature).to eq(70)
  end

  it 'can add an item' do
    item = Item.new('FAKE', 100)
    old_cap = freezer.remaining_capacity
    freezer.add(item)
    expect(freezer.remaining_capacity).to_not eq(old_cap)
  end

  it 'can check capacity' do
    expect(freezer.remaining_capacity).to eq(100)
  end

  it 'can set level' do
    freezer.set_level(5)
    expect(freezer.temperature).to eq(20)
  end

end
