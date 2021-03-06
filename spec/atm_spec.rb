require './lib/atm.rb'

describe Atm do
  let(:account) {instance_double('Account', pin_code: '1234', exp_date: '04/17', account_status: :active)}

  before do
    allow(account).to receive(:balance).and_return (100)
    allow(account).to receive(:balance=)
  end

  it 'has $1000 on initialize' do
    expect(subject.funds).to eq 1000
  end

  it 'has a name \'ICA\'' do
    expect(subject.atm).to eq 'ICA'
  end

  it 'reduces funds with withdrawals' do
    subject.withdraw(50, '1234', account)
    expect(subject.funds).to eq 950
  end

  it 'allows withdrawals if account has enough balance' do
    expected_output = {status: true, message: 'success', date: Date.today, amount: 45, bills: [20, 20 ,5], account_status: :active}
    expect(subject.withdraw(45, '1234', account)).to eq expected_output
  end

  it 'rejects withdrawals if account has insufficient funds' do
    expected_output = { status: false, message: 'insufficient funds in account', date: Date.today }
    expect(subject.withdraw(105, '1234', account)).to eq expected_output
  end

  it 'rejects withdrawals if ATM machine has insufficient funds' do
    subject.funds = 50
    expected_output = { status: false, message: 'insufficient funds in ATM', date: Date.today }
    expect(subject.withdraw(100, '1234', account)).to eq expected_output
  end

  it 'rejects withdrawals if pin code is incorrect' do
    expected_output = { status: false, message: 'wrong pin code', date: Date.today }
    expect(subject.withdraw(50, 9999, account)).to eq expected_output
  end

  it 'rejects withdrawals if atm card is expired' do
    allow(account).to receive(:exp_date).and_return('12/15')
    expected_output = { status: false, message: 'card expired', date: Date.today }
    expect(subject.withdraw(5, '1234', account)).to eq expected_output
  end

  context 'account is disabled' do
    let(:account) {instance_double('Account', pin_code: '1234', exp_date: '04/17', account_status: :disabled)}

    it 'rejects withdrawals if account is disabled' do
      expected_output = { status: false, message: 'account disabled', date: Date.today }
      expect(subject.withdraw(5, '1234', account)).to eq expected_output
    end
  end

end
