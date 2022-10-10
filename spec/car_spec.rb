require 'spec_helper'
require 'car'

RSpec.describe Car do
  describe 'happy cases' do
    let(:reg_num) { 'ASD 123 HH' }
    let(:color) { 'White' }
    subject(:car) { Car.new(reg_num, color) }

    it 'has proper attribute values' do
      expect(car.reg_num).to eq(reg_num)
      expect(car.color).to eq(color)
    end
  end

  describe 'non happy case' do
    let(:color) { 'White' }
    subject(:car) { Car.new(color) }

    it 'fails to create car object' do
      expect{car}.to raise_error(ArgumentError)
    end
  end
end