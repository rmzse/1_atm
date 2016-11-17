class Person
  attr_accessor :name

  # def initialize(args = {})
  def initialize(arg)
    @name = arg
    # args[:name] != nil ? (@name = args[:name] ) : (raise 'Error: Missing account owner! An account owner must be set!')

  end

end
