require_relative './slot'
require_relative './base'

class ParkingLot < Base

  attr_accessor :slots

  def initialize(slots)
    raise ArgumentError unless slots.is_a?(Integer)
    @slots = []
    (1..slots).each {|index| @slots << Slot.new(index)}
    puts ParkingLot::PARKING_CREATED_MESSAGE.gsub("#slots#", slots.to_s)
  end

  def park(registration_number, color)
    raise ArgumentError unless registration_number.is_a?(String) || color.is_a?(String)

  end

  p = ParkingLot.new(5)
  puts p.inspect

  private

  def nearest_free_slot

  end



end