class Person
  attr_accessor :name, :cash, :account

  def initialize(args = {})
    args[:name] != nil ? (@name = args[:name] ) : (raise 'Error: You need a person name!')
    @cash = 0
    raise 'Error: Account not nil!' if args[:account] != nil
    # @account = args[:account] if account.respond_to?(:disable_account)
    create_account(args[:account])
  end

  def create_account(hash_arg)
    account.respond_to?(:disable_account) ? (@account = args[:account]) : (raise 'Error: Account type mismatch.')
  end

end
