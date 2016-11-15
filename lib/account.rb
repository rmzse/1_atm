class Account
  attr_accessor :pin_code, :exp_date, :account_status, :account_owner

  def initialize
    @pin_code = '1234'
    @exp_date = '04/17'
    @account_status = :active
    @account_owner = 'Rod'
    
  end

  def correct_pin_length?(number)
    number_length = Math.log10(number.to_i).to_i + 1
    number_length == 4
  end

end
