require './lib/parking_lot'

describe ParkingLot do

  describe '.initialize' do
    context "when parking lot is initialize with proper number of slots as integer" do
      before :each do
        parking_lot = ParkingLot.new(6)
      end
      it {expect(parking_lot).to be_instance_of(ParkingLot)}
      it {expect(parking_lot.slots).not_to be_empty}
      it {expect(parking_lot.slots.size).to eql(6)}
    end

    context "when parking lot is initialize with number of slots other than integer it should raise exception" do
      it {expect(lambda {ParkingLot.new("6")}).to raise_exception ArgumentError }
      it {expect(lambda {ParkingLot.new(6.5)}).to raise_exception ArgumentError }
      it {expect(lambda {ParkingLot.new([1,2])}).to raise_exception ArgumentError }
      it {expect(lambda {ParkingLot.new({})}).to raise_exception ArgumentError }
    end

    context "when parking lot is initialized with no arguments" do
      it {expect(lambda {ParkingLot.new}).to raise_exception ArgumentError }
    end

  end

end