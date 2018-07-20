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
    slot = nearest_free_slot
    puts ParkingLot::PARKING_FULL_MESSAGE and return unless slot
    slot.park(registration_number, color)
    puts ParkingLot::PARKING_ALLOCATED_MESSAGE.gsub("#slot#", slot.id.to_s)
  end


  def leave slot
    raise ArgumentError unless slot.is_a?(Integer)
  end


  private

  def nearest_free_slot
    slots.find {|slot| slot.is_vacant? }
  end



end