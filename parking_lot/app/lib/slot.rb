require './config/constant'

class Slot

  attr_accessor :id, :car

  def initialize(id)
    raise ArgumentError unless id.is_a?(Integer)
    @id = id
  end

end