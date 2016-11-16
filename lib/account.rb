require 'date'

class Account
  STANDARD_VALIDITY_YRS = 5
  attr_accessor :pin_code, :exp_date, :account_status, :account_owner

  def initialize(arg)
    @pin_code = rand(1000..9999).to_s
    @exp_date = set_card_exp_date
    @account_status = :active
    @account_owner = arg[:account_owner]
  end

  def disable_account
    @account_status = :disabled
  end

  private

  def set_card_exp_date
    Date.today.next_year(STANDARD_VALIDITY_YRS).strftime("%m/%y")
  end

end
