class Account
  attr_accessor :pin_code, :exp_date, :account_status

  def initialize
    @pin_code = '1234'
    @exp_date = '04/17'
    @account_status = :active
  end

end
