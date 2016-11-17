require './lib/person.rb'
# require './lib/atm.rb'

describe Person do
  subject { described_class.new(name: 'Xerxes') }

  it 'has a :name on initialize' do
    expect(subject.name).not_to be nil
  end

end
