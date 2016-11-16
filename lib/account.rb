require 'date'

class Account
  STANDARD_VALIDITY_YRS = 5
  attr_accessor :pin_code, :exp_date, :account_status, :account_owner

  def initialize(args = {})
    @pin_code = rand(1000..9999).to_s
    @exp_date = set_card_exp_date
    @account_status = :active
    has_account_owner?(args[:account_owner]) ? set_account_owner(args[:account_owner]) : raise_missing_owner_error
  end

  def disable_account
    @account_status = :disabled
  end

  private

  def has_account_owner?(account_owner_hash)
    account_owner_hash !=  nil
  end

  def set_account_owner(account_owner_hash)
    @account_owner = account_owner_hash
  end

  def raise_missing_owner_error
    raise 'Error: Missing account owner! An account owner must be set!'
  end

  def set_card_exp_date
    Date.today.next_year(STANDARD_VALIDITY_YRS).strftime("%m/%y")
  end

end
