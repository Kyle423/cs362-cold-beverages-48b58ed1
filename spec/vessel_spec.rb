require_relative '../lib/vessel'

describe 'A vessel for holding liquid' do

  let(:vessel) { Vessel.new('FAKE', 100) }

  it 'has a name and volume' do
    expect(vessel.name).to eq('FAKE')
    expect(vessel.volume).to eq(100)
  end

  it 'is initially empty' do
    expect(vessel.empty?)
  end

  it 'is no longer empty when we fill it' do
    vessel.fill
    expect(!vessel.empty?)
  end
end
