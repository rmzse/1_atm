class Person
  attr_accessor :name, :cash, :account

  def initialize(args = {})
    args[:name] != nil ? (@name = args[:name] ) : (raise 'Error: You need a person name!')
    @cash = 0
    raise 'Error: Account not nil!' if args[:account] != nil
    # account.respond_to?(:disable_account) ? (@account = args[:account]) : (raise 'Error: Account type mismatch.')
    @account = args[:account] if account.respond_to?(:disable_account)  
  end

end
