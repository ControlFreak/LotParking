require_relative './base'
require_relative './car'

class Slot < Base

  attr_accessor :id, :car

  def initialize(id)
    raise ArgumentError unless id.is_a?(Integer)
    @id = id
  end

  def park(registration_number, color)
    raise ArgumentError unless registration_number.is_a?(String) || color.is_a?(String)
    raise StandardError.new(Slot::SLOT_OCCUPIED_MESSAGE) if self.car
    self.car = Car.new(registration_number, color)
  end

  def unpark
    self.car = nil
  end

  def is_vacant?
    self.car == nil
  end

end