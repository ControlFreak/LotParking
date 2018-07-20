require './lib/parking_lot'
require './config/constant'

describe ParkingLot do

  describe '.initialize' do

    context "when ParkingLot can be initialized" do
      it {expect(ParkingLot).to respond_to(:new)}
    end

    context "when parking lot is initialized with no arguments" do
      it {expect(lambda {ParkingLot.new}).to raise_exception ArgumentError }
    end

    context "when parking lot is initialize with number of slots other than integer it should raise exception" do
      it {expect(lambda {ParkingLot.new("6")}).to raise_exception ArgumentError }
      it {expect(lambda {ParkingLot.new(6.5)}).to raise_exception ArgumentError }
      it {expect(lambda {ParkingLot.new([1,2])}).to raise_exception ArgumentError }
      it {expect(lambda {ParkingLot.new({})}).to raise_exception ArgumentError }
    end

    context "when parking lot is initialize with proper number of slots as integer" do
      before :each do
        parking_lot = ParkingLot.new(6)
      end
      it {expect(parking_lot).to be_instance_of(ParkingLot)}
      it {expect(parking_lot.slots).not_to be_empty}
      it {expect(parking_lot.slots.size).to eql(6)}
    end

  end

  describe '#park' do
    before :each do
      parking_lot = ParkingLot.new(1)
    end
    context "when parking lot has method defined as park" do
      it {expect(parking_lot).to respond_to(:park)}
    end

    context "when park is called without any arguments" do
      it {expect(parking_lot.park()).to raise_exception ArgumentError }
    end

    context "when park is called with invalid arguments" do
      it {expect(parking_lot.park(1,2)).to raise_exception ArgumentError }
      it {expect(parking_lot.park("KA-01-HH-1234")).to raise_exception ArgumentError }
      it {expect(parking_lot.park([1,2])).to raise_exception ArgumentError }
    end

    context "when park is called with valid arguments i.e registration_number and color of car" do
      it {expect(parking_lot.park("KA-01-HH-1234", "white")).to eq($stderr.puts PARKING_ALLOCATED_MESSAGE %{slot: 1})}
      it "should return parking full message if parking is full" do
        parking_lot.park("KA-01-HH-1234", "white")
        expect(parking_lot.park("KA-01-HH-4321", "black")).to eq($stderr.puts PARKING_FULL_MESSAGE)
      end
    end

  end

end