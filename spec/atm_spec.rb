require './lib/atm.rb'

describe Atm do
  let(:account) {instance_double('Account')}

  before do
    allow(account).to receive(:balance).and_return (100)
    allow(account).to receive(:balance=)
  end

  it 'has $1000 on initialize' do
    expect(subject.funds).to eq 1000
  end

  it 'reduces funds with withdrawals' do
    subject.withdraw(50, account)
    expect(subject.funds).to eq 950
  end

  it 'allows withdrawals if account has enough balance' do
    expected_output = {status: true, message: 'success', date: Date.today, amount: 45}
    expect(subject.withdraw(45, account)).to eq expected_output
  end

  it 'rejects withdrawals if account has insufficient funds' do
    expected_output = { status: false, message: 'insufficient funds in account', date: Date.today }
    expect(subject.withdraw(105, account)).to eq expected_output
  end

  it 'rejects withdrawals if ATM machine has insufficient funds' do
    subject.funds = 50
    expected_output = { status: false, message: 'insufficient funds in ATM', date: Date.today }
    expect(subject.withdraw(100, account)).to eq expected_output
  end

end
