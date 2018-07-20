require_relative './slot'
require './config/constant'

class ParkingLot

  attr_accessor :slots

  def initialize(slots)
    raise ArgumentError unless slots.is_a?(Integer)
    @slots = []
    (1..slots).each {|index| @slots << Slot.new(index)}
  end

end