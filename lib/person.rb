require './lib/account.rb'

class Person
  attr_accessor :name, :cash, :account, :atm

  def initialize(args = {})
    args[:name] != nil ? (@name = args[:name] ) : (raise 'Error: You need a person name!')
    @cash = 0 #args[:cash]
    raise 'Error: Account not nil!' if args[:account] != nil
  end

  def create_account
    @account = Account.new({ account_owner: self })
  end

  def deposit(amount)
    raise 'No account for deposits present.' if @account == nil
    @cash -= amount
    @account.balance += amount
  end

  def withdraw(args = {})
    raise 'An ATM is required.' if args[:atm] == nil
    @cash += args[:amount]
    @account.balance -= args[:amount]
  end

end
