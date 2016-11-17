require './lib/person.rb'
# require './lib/atm.rb'

describe Person do
  subject { described_class.new(name: 'Xerxes', cash: 0, account: nil ) }

  it 'has a :name on initialize' do
    expect(subject.name).not_to be nil
  end

  it 'is expected to raise error if no name is set' do
    expect { described_class.new }.to raise_error 'Error: You need a person name!'
  end

  it 'is expected to have a :cash attribute with value of 0 on initialize' do
    expect(subject.cash).to eq 0
  end

  it 'has an :account attribute' do
    expect(subject.account).to be nil
  end

  context 'this person can open an account = create an Account' do
    before '{ subject.create_account }' do
      it 'Person account attrib is of Account class' do
        expect(subject.account).to be_an_instance_of Account
      end
    end

  end

end
