require './lib/parking_lot'

describe ParkingLot do

  describe '.initialize' do

    context "when ParkingLot can be initialized" do
      it {expect(ParkingLot).to respond_to(:new)}
    end

    context "when parking lot is initialized with no arguments" do
      it {expect(lambda {ParkingLot.new}).to raise_exception ArgumentError}
    end

    context "when parking lot is initialize with number of slots other than integer it should raise exception" do
      it {expect(lambda {ParkingLot.new("6")}).to raise_exception ArgumentError}
      it {expect(lambda {ParkingLot.new(6.5)}).to raise_exception ArgumentError}
      it {expect(lambda {ParkingLot.new([1, 2])}).to raise_exception ArgumentError}
      it {expect(lambda {ParkingLot.new({})}).to raise_exception ArgumentError}
    end

    context "when parking lot is initialize with proper number of slots as integer" do
      before :each do
        @parking_lot = ParkingLot.new(6)
      end
      it {expect(@parking_lot).to be_instance_of(ParkingLot)}
      it {expect(@parking_lot.slots).not_to be_empty}
      it {expect(@parking_lot.slots.size).to eql(6)}
    end

  end

  describe '#park' do
    before :each do
      @parking_lot = ParkingLot.new(1)
    end
    context "when parking lot has method defined as park" do
      it {expect(@parking_lot).to respond_to(:park)}
    end

    context "when park is called without any arguments" do
      it {expect(lambda {@parking_lot.park()}).to raise_exception ArgumentError}
    end

    context "when park is called with invalid arguments" do
      it {expect(lambda {@parking_lot.park(1, 2)}).to raise_exception ArgumentError}
      it {expect(lambda {@parking_lot.park("KA-01-HH-1234")}).to raise_exception ArgumentError}
      it {expect(lambda {@parking_lot.park([1, 2])}).to raise_exception ArgumentError}
    end

    context "when park is called with valid arguments i.e registration_number and color of car" do
      it {expect(@parking_lot.park("KA-01-HH-1234", "white")).to eq($stderr.puts ParkingLot::PARKING_ALLOCATED_MESSAGE.gsub("#slot#", "1"))}
      it "should return parking full message if parking is full" do
        @parking_lot.park("KA-01-HH-1234", "white")
        expect(@parking_lot.park("KA-01-HH-4321", "black")).to eq($stdout.puts ParkingLot::PARKING_FULL_MESSAGE)
      end
    end

  end

  describe '#leave' do
    before :each do
      @parking_lot = ParkingLot.new(1)
      @parking_lot.park("KA-01-HH-1234", "white")
    end

    context "Parking Lot should have method defined as leave" do
      it {expect(@parking_lot).to respond_to(:leave)}
    end

    context "when leave is called on parking lot with invalid argument" do
      it {expect(lambda {@parking_lot.leave()}).to raise_exception ArgumentError}
      it {expect(lambda {@parking_lot.leave("1")}).to raise_exception ArgumentError}
      it {expect(lambda {@parking_lot.leave([1])}).to raise_exception ArgumentError}
      it {expect(@parking_lot.leave(2)).to eq($stdout.puts ParkingLot::INVALID_SLOT_MESSAGE)}
    end

    context "when leave is called with correct arguement" do
      it {expect(@parking_lot.leave(1)).to eq($stdout.puts ParkingLot::PARKING_LEAVE_SLOT_MESSAGE.gsub("#slot#", "1"))}
    end

  end

  describe '#status' do
    before :each do
      @parking_lot = ParkingLot.new(1)
    end

    context "Parking Lot should have method defined as status" do
      it {expect(@parking_lot).to respond_to(:status)}
    end

#     context "when cars are parked" do
#       it "should return slot with car registration number and color in tablular format" do
#         @parking_lot.park("KA-01-HH-1234", "White")
#         expect(@parking_lot.status).to end_with(<<-EOTXT
# Slot No.    Registration No    Colour
# 1           KA-01-HH-1234      White
#                                       EOTXT )
#
#       end
#     end
  end

  describe '#registration_numbers_for_cars_with_colour' do
    before :each do
      @parking_lot = ParkingLot.new(1)
      @parking_lot.park("KA-01-HH-1234", "White")
    end

    context "Parking Lot should have method defined as registration_numbers_for_cars_with_colour" do
      it {expect(@parking_lot).to respond_to(:registration_numbers_for_cars_with_colour)}
    end

    context "when registration_numbers_for_cars_with_colour is called with invalid arguments" do
      it {expect(lambda {@parking_lot.registration_numbers_for_cars_with_colour()}).to raise_exception ArgumentError }
      it {expect(lambda {@parking_lot.registration_numbers_for_cars_with_colour(1)}).to raise_exception ArgumentError }
      it {expect(lambda {@parking_lot.registration_numbers_for_cars_with_colour([])}).to raise_exception ArgumentError }
    end

    context "when registration_numbers_for_cars_with_colour is called with correct arguments" do
      it {expect(@parking_lot.registration_numbers_for_cars_with_colour("White")).to eq($stdout.puts "KA-01-HH-1234" ) }
      it {expect(@parking_lot.registration_numbers_for_cars_with_colour("Black")).to eq($stdout.puts ParkingLot::NO_CAR_FOUND_MESSAGE ) }
    end

  end

  describe '#slot_numbers_for_cars_with_colour' do
    before :each do
      @parking_lot = ParkingLot.new(1)
      @parking_lot.park("KA-01-HH-1234", "White")
    end

    context "Parking Lot should have method defined as slot_numbers_for_cars_with_colour" do
      it {expect(@parking_lot).to respond_to(:slot_numbers_for_cars_with_colour)}
    end

    context "when slot_numbers_for_cars_with_colour is called with invalid arguments" do
      it {expect(lambda {@parking_lot.slot_numbers_for_cars_with_colour()}).to raise_exception ArgumentError }
      it {expect(lambda {@parking_lot.slot_numbers_for_cars_with_colour(1)}).to raise_exception ArgumentError }
      it {expect(lambda {@parking_lot.slot_numbers_for_cars_with_colour([])}).to raise_exception ArgumentError }
    end

    context "when registration_numbers_for_cars_with_colour is called with correct arguments" do
      it {expect(@parking_lot.slot_numbers_for_cars_with_colour("White")).to eq($stdout.puts "1" ) }
      it {expect(@parking_lot.slot_numbers_for_cars_with_colour("Black")).to eq($stdout.puts ParkingLot::NO_CAR_FOUND_MESSAGE  ) }
    end
  end

  describe '#slot_number_for_registration_number' do
    before :each do
      @parking_lot = ParkingLot.new(1)
      @parking_lot.park("KA-01-HH-1234", "White")
    end

    context "Parking Lot should have method defined as slot_number_for_registration_number" do
      it {expect(@parking_lot).to respond_to(:slot_number_for_registration_number)}
    end

    context "when registration_numbers_for_cars_with_colour is called with invalid arguments" do
      it {expect(lambda {@parking_lot.slot_number_for_registration_number()}).to raise_exception ArgumentError }
      it {expect(lambda {@parking_lot.slot_number_for_registration_number(1)}).to raise_exception ArgumentError }
      it {expect(lambda {@parking_lot.slot_number_for_registration_number([])}).to raise_exception ArgumentError }
    end

    context "when registration_numbers_for_cars_with_colour is called with correct arguments" do
      it {expect(@parking_lot.slot_number_for_registration_number("KA-01-HH-1234")).to eq($stdout.puts "1" ) }
      it {expect(@parking_lot.slot_number_for_registration_number("KA-01-MM-1234")).to eq($stdout.puts ParkingLot::NO_CAR_FOUND_MESSAGE ) }
    end
  end

end