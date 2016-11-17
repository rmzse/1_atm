class Person
  attr_accessor :name, :cash

  def initialize(args = {})
    args[:name] != nil ? (@name = args[:name] ) : (raise 'Error: You need a person name!')
    @cash = 0
    raise 'Error: Account not nil!' if args[:account] != nil
  end

end
