require_relative './slot'
require_relative './base'

class ParkingLot < Base

  attr_accessor :slots

  def initialize(slots)
    raise ArgumentError unless slots.is_a?(Integer)
    @slots = []
    (1..slots).each {|index| @slots << Slot.new(index)}
    puts PARKING_CREATED_MESSAGE.gsub("#slots#", slots.to_s)
  end

  def park(registration_number, color)
    raise ArgumentError unless registration_number.is_a?(String) || color.is_a?(String)
    slot = nearest_free_slot
    return puts PARKING_FULL_MESSAGE unless slot
    car = slots.collect {|slot| slot if slot.car && slot.car.registration_number == registration_number.downcase }.compact
    return puts CAR_ALREADY_PARKED unless car.empty?
    slot.park(registration_number, color)
    puts PARKING_ALLOCATED_MESSAGE.gsub("#slot#", slot.id.to_s)
  end


  def leave slot
    raise ArgumentError unless slot.is_a?(Integer)
    return puts INVALID_SLOT_MESSAGE if slot > slots.length || slot == 0
    slots[slot-1].unpark
    puts PARKING_LEAVE_SLOT_MESSAGE.gsub("#slot#", slot.to_s)
  end

  def status
    puts "Slot No.\t Registration Number\t Colour"
    slots.each do |slot|
      puts "#{ slot.id }\t\t\t #{ slot.car.registration_number.upcase }\t\t\t #{ slot.car.color.capitalize }" unless (slot.is_vacant?)
    end
  end

  def registration_numbers_for_cars_with_colour color
    raise ArgumentError unless color.is_a?(String)
    cars = slots.collect {|slot| slot.car.registration_number.upcase if slot.car && slot.car.color == color.downcase }.compact
    return puts NO_CAR_FOUND_MESSAGE unless cars
    puts cars.join(", ")
  end

  def slot_numbers_for_cars_with_colour color
    raise ArgumentError unless color.is_a?(String)
    cars = slots.collect {|slot| slot.id if slot.car && slot.car.color == color.downcase }.compact
    return puts NO_CAR_FOUND_MESSAGE unless cars
    puts cars.join(", ")
  end

  def slot_number_for_registration_number registration_number
    raise ArgumentError unless registration_number.is_a?(String)
    cars = slots.collect {|slot| slot.id if slot.car && slot.car.registration_number == registration_number.downcase }.compact
    return puts NO_CAR_FOUND_MESSAGE unless cars
    puts cars.join(", ")
  end

  private

  def nearest_free_slot
    slots.find {|slot| slot.is_vacant?}
  end

end

p = ParkingLot.new(5)
p.park("KA-01-HH-1234", "White")
p.park("KA-01-HH-1234", "White")
puts p.slots.inspect