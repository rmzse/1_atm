require './lib/account.rb'

describe Account do

  it 'has a pincode "1234" on initialize'
    expect(subject.pin_code).to eq "1234"
  end



end
