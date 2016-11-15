require './lib/account.rb'


describe Account do

  it 'has a pincode "1234" on initialize' do
    #expect(subject.pin_code).to eq account.pin_code
    expect(subject.pin_code).to eq '1234'
  end

  it 'has an ATM card with expiry date of 11/22 on initialize' do
    expect(subject.exp_date).to eq '11/21'
  end

  it 'has an account status of "active" on initialize' do
    expect(subject.account_status).to eq(:active)
  end

  it 'has an account owner on initialize' do
    expect(subject.account_owner).to eq 'Rod'
  end

  it 'checks if the pin code is 4 digits on initialize' do
    expect(subject.pin_code_length).to eq 4
  end


end
