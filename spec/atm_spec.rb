require './lib/atm.rb'

describe Atm do
  let(:account) {instance_double('Account')}

  before do
    allow(account).to receive(:balance).and return (100)
    allow(account).to receive(:balance=)
  end

  it 'has $1000 on initialize' do
    expect(subject.funds).to eq 1000
  end

  it 'reduces funds with withdrawals' do
    subject.withdraw 50
    expect(subject.funds).to eq 950
  end
end
