require_relative './base'
require_relative './parking_lot'
require "readline"

class ParkingLotHandler < Base

  @@parking_lot = nil

  def run(file=nil)
    if file
      File.open(file).each do |line|
        line = line.chomp
        decode_command(line)
      end
    else
      while buf = Readline.readline("$ ", true)
        decode_command(buf)
      end
    end
  end

  def decode_command(input)
    command = input.split(/\s/)
    case command[0]
      when "create_parking_lot"
        slots = command[1]
        begin
          @@parking_lot = ParkingLot.new(slots.to_i)
        rescue Exception => e
          puts e.message
        end
      when "park", "leave", "status", "registration_numbers_for_cars_with_colour", "slot_numbers_for_cars_with_colour", "slot_number_for_registration_number"
        return puts PARKING_NOT_FOUND unless @@parking_lot
        begin
          command[1] = command[1].to_i if command[0] == "leave"
          @@parking_lot.send(command[0], *([command[1], command[2]].compact))
        rescue Exception => e
          puts e.message
        end
      when "exit"
        exit
      else
        puts "Unrecognised Command"
    end
  end

end