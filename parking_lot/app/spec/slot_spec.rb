require './lib/slot'

describe Slot do

  describe '.initialize' do

    context "Slot can be initialized" do
      it {expect(Slot).to respond_to(:new) }
    end

    context "when slot is initialized with invalid argument" do
      it {expect(lambda {Slot.new()}).to raise_exception ArgumentError}
      it {expect(lambda {Slot.new([])}).to raise_exception ArgumentError}
      it {expect(lambda {Slot.new("1")}).to raise_exception ArgumentError}
    end

    context "when slot is initialized with valid arguments" do
      before :each do
        @slot = Slot.new(1)
      end
      it {expect(@slot).to be_instance_of(Slot) }
    end

  end

  before :each do
    @slot = Slot.new(1)
  end

  describe '#park' do
    context "when parking lot has method defined as park" do
      it {expect(@slot).to respond_to(:park)}
    end

    context "when park is called without any arguments" do
      it {expect(lambda {@slot.park()}).to raise_exception ArgumentError}
    end

    context "when park is called with invalid arguments" do
      it {expect(lambda {@slot.park(1, 2)}).to raise_exception ArgumentError}
      it {expect(lambda {@slot.park("KA-01-HH-1234")}).to raise_exception ArgumentError}
      it {expect(lambda {@slot.park([1, 2])}).to raise_exception ArgumentError}
    end

    context "when park is called with valid arguments i.e registration_number and color of car" do
      before :each do
        @slot.park("KA-01-HH-1234", "White")
      end
      it {expect(@slot.car).to be_instance_of(Car)}
      it {expect(@slot.car.registration_number).to eq("KA-01-HH-1234")}
      it {expect(@slot.car.color).to eq("White")}
    end
  end

  describe '#unpark' do

  end

  describe '#is_vacant?' do

  end

end