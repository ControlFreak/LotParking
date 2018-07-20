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


  describe '#park' do

    before :each do
      @slot = Slot.new(1)
    end

    context "when slot has method defined as park" do
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
      it {expect(@slot.car.registration_number.upcase).to eq("KA-01-HH-1234")}
      it {expect(@slot.car.color.capitalize).to eq("White")}

    end
  end



  describe '#unpark' do
    before :each do
      @slot = Slot.new(1)
    end

    context "when slot has method defined as unpark" do
      it {expect(@slot).to respond_to(:unpark)}
    end

    context "when unpark is called for slot" do
      @slot = Slot.new(1)
      @slot.park("KA-01-HH-1234", "White")
      @slot.unpark
      it {expect(@slot.car).to eq(nil) }
    end

  end

  describe '#is_vacant?' do
    before :each do
      @slot = Slot.new(1)
    end

    context "when slot has method defined as is_vacant?" do
      it {expect(@slot).to respond_to(:is_vacant?)}
    end

    context "when slot is vacant it should return true" do
      it {expect(@slot.is_vacant?).to be(true)}
    end

    context "when slot is not vacant it should return false" do
      slot = Slot.new(1)
      slot.park("KA-01-HH-1234", "White")
      puts slot.is_vacant?
      it {expect(slot.is_vacant?).to be(false)}
    end

  end

end