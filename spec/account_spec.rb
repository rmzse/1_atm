require './lib/account.rb'

describe Account do

  it 'has a pincode "1234" on initialize' do
    expect(subject.pin_code).to eq '1234'
  end

  it 'has an ATM card with expiry date of 04/17 on initialize' do
    
  end


end
