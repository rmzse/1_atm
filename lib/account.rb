require 'date'

class Account
  STANDARD_VALIDITY_YRS = 5
  attr_accessor :pin_code, :exp_date, :account_status, :account_owner, :balance

  def initialize(args = {})
    @pin_code = rand(1000..9999).to_s
    @exp_date = set_card_exp_date
    @account_status = :active
    args[:account_owner] != nil ? (@account_owner = args[:account_owner] ) : (raise 'Error: Missing account owner! An account owner must be set!')
    @balance = 0
  end

  def disable_account
    @account_status = :disabled
  end

  private

  def set_card_exp_date
    Date.today.next_year(STANDARD_VALIDITY_YRS).strftime("%m/%y")
  end

end
