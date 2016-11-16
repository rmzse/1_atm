require './lib/account.rb'


describe Account do
  let(:person) {instance_double('Person', name: 'Rod')}
  subject { described_class.new( {account_owner: person} ) }

  it 'has a randomized pincode of 4 digits on initialize' do
    pin_code_length = Math.log10(subject.pin_code.to_i).to_i + 1
    expect(pin_code_length).to eq 4
  end

  it 'has an ATM card with expiry date of 11/22 on initialize' do
    expect(subject.exp_date).to eq '11/21'
  end

  it 'has an account status of "active" on initialize' do
    expect(subject.account_status).to eq :active
  end

  it 'has an account owner on initialize' do
    expect(subject.account_owner).to eq person
  end

  it 'disables an account for a person (instance)' do
    subject.disable_account
    expect(subject.account_status).to eq :disabled
  end

  it 'raises an error if no owner is set' do
    expect{ described_class.new }.to raise_error 'Error: An account owner must be set!'
  end


end
