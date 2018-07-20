require './lib/car'

describe Car do

  describe '.initialize' do
    context "Can can be initialized" do
      it {expect(Car).to respond_to(:new) }
    end

    context "when car is initialized with invalid argument" do
      it {expect(lambda {Car.new()}).to raise_exception ArgumentError}
      it {expect(lambda {Car.new([])}).to raise_exception ArgumentError}
      it {expect(lambda {Car.new("1")}).to raise_exception ArgumentError}
    end

    context "when car is initialized with valid arguments" do
      before :each do
        @car = Car.new("KA-01-HH-1234", "White")
      end
      it {expect(@car).to be_instance_of(Car) }
      it {expect(@car.registration_number).to eq("KA-01-HH-1234")}
      it {expect(@car.color).to eq("White")}
    end
  end

end