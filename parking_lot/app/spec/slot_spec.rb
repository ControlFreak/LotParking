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
        slot = Slot.new(1)
      end
      it {expect(slot).to be_instance_of(Slot) }
    end

  end

end