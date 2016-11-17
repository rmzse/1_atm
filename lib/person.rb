require './lib/account.rb'

class Person
  attr_accessor :name, :cash, :account

  def initialize(args = {})
    args[:name] != nil ? (@name = args[:name] ) : (raise 'Error: You need a person name!')
    @cash = 0
    raise 'Error: Account not nil!' if args[:account] != nil
  end

  def create_account
    @account = Account.new({ account_owner: self })
  end

  def deposit(amount)
    amount
  end

end
