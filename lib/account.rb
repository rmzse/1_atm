require 'date'

class Account
  STANDARD_VALIDITY_YRS = 5
  attr_accessor :pin_code, :exp_date, :account_status, :account_owner, :pin_code_length

  def initialize
    @pin_code = rand(1000..9999).to_s
    #@pin_code = '1234'
    @exp_date = set_card_exp_date
    @account_status = :active
    @account_owner = 'Rod'
    @pin_code_length = get_n_length(pin_code)
  end

  def disable_account
    @account_status = :disabled
  end

  private

  def get_n_length(number)
    number_length = Math.log10(number.to_i).to_i + 1
  end

  def set_card_exp_date
    Date.today.next_year(STANDARD_VALIDITY_YRS).strftime("%m/%y")
  end

end
