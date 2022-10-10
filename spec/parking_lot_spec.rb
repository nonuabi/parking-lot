require "spec_helper"
require "parking_lot"
require "car"

RSpec.describe ParkingLot do
  describe "happy cases" do
    let(:size) {6}
    subject(:parking_lot) { ParkingLot.new(size)}

    it 'can occupy x number of cars' do
      expect(parking_lot.slots.size).to eq(size)
    end

    describe "next available slots" do
      let(:size) {6}
      it 'return next available slot' do
        expect(parking_lot.next_available_slot).to eq(nil)
      end

      let(:size) {0}
      it 'return nil for empty slot' do
        expect(parking_lot.next_available_slot).to eq(nil)
      end
    end

    describe "park car" do
      let(:size) {1}
      let(:reg_num) { 'ASD 123 HH' }
      let(:color) { 'White' }
      subject(:car) { Car.new(reg_num, color) }

      it 'park the car on nearest slot' do
        expect(parking_lot.park(car, parking_lot.next_available_slot)).to eq(nil)
      end
    end

    describe "park" do
      let(:size) {6}
      let(:color) {"White"}
      subject(:car1) {Car.new("HR-31-1000", "White")}
      subject(:car2) {Car.new("HR-31-2000", "Red")}
      subject(:car3) {Car.new("HR-31-4000", "White")}
      subject(:parking_lot) {ParkingLot.new(size)}

      it 'return array of registration number' do
        parking_lot.park(car1, parking_lot.next_available_slot)
        parking_lot.park(car2, parking_lot.next_available_slot)
        parking_lot.park(car3, parking_lot.next_available_slot)
        expect(parking_lot.get_registration_numbers_by_color(color)).to eq(["HR-31-1000", "HR-31-4000"])
      end

      it 'return empty array' do
        expect(parking_lot.get_registration_numbers_by_color(color)).to eq([])
      end

      it 'return ticket number by registration_number' do
        parking_lot.park(car1, parking_lot.next_available_slot)
        parking_lot.park(car2, parking_lot.next_available_slot)
        parking_lot.park(car3, parking_lot.next_available_slot)
        expect(parking_lot.get_ticket_number_by_registration_number("HR-31-1000")).to eq("T1")
      end

      it 'return array of ticket number by color' do
        parking_lot.park(car1, parking_lot.next_available_slot)
        parking_lot.park(car2, parking_lot.next_available_slot)
        parking_lot.park(car3, parking_lot.next_available_slot)
        expect(parking_lot.get_ticket_numbers_by_color("White")).to eq(["T1", "T3"])
      end
    end
  end

  describe "non happy cases" do
    it 'fails to create parking lot object' do
      expect{parking_lot}.to raise_error{ArgumentError}
    end

    describe "park car" do
      let(:size) {6}
      let(:reg_num) { 'ASD 123 HH' }
      let(:color) { 'White' }
      subject(:car) { Car.new(reg_num, color) }
      subject(:parking_lot) { ParkingLot.new(car) }

      it 'fails to park the car to the nearest slot' do
        expect{parking_lot}.to raise_error{ArgumentError}
      end
    end
  end
end
