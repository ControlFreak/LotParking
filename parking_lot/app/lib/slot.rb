require_relative './base'

class Slot < Base

  attr_accessor :id, :car

  def initialize(id)
    raise ArgumentError unless id.is_a?(Integer)
    @id = id
  end

  def park(registration_number, color)

  end

  def unpark
    self.car = nil
  end

  def is_vacant?
    self.car == nil
  end

end