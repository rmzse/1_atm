class Person
  attr_accessor :name, :cash, :account

  def initialize(args = {})
    args[:name] != nil ? (@name = args[:name] ) : (raise 'Error: You need a person name!')
    @cash = 0
    raise 'Error: Account not nil!' if args[:account] != nil
    # binding.pry
    @account = args[:account] if account.respond_to?(:disable_account)
    # binding.pry
    create_account(args[:account])
    # binding.pry
  end

  def create_account(hash_arg)
    # binding.pry
    @account = args[:account] if account.respond_to?(:disable_account)
    # code below doesn't pass, since we haven't specified raising an err in the spec
    # account.respond_to?(:disable_account) ? (@account = args[:account]) : (raise 'Error: Account type mismatch.')
  end

end
