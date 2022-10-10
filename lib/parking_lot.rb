class ParkingLot
  attr_accessor :slots, :tickets
  @@ticket_number = 100
  def initialize(size)
    @slots = Array.new(size)
    @tickets = []
  end

  def next_available_slot
    slots.each_with_index do |slot, index|
      return (index+1) if slot.nil?
    end

    nil
  end

  def park(car , slot_number)
    return  puts "Parking lot is full!" unless next_available_slot
    return puts "This slot is already taken!!" unless slots[slot_number-1].nil?
    slots[slot_number-1] = car
    tickets << slots[slot_number-1]
    puts "Car with registration number #{car.reg_num} and color #{car.color} has been parked into #{slot_number}"
  end

  def leave(slot_number)
    slot[slot_number-1] = nil
  end

  def get_registration_numbers_by_color(color)
    registration_numbers = []
    slots.each do |car|
      registration_numbers.push(car.reg_num) if !car.nil? && car.color == color
    end

    print_data("Finding registration Numbers By Color #{color}", registration_numbers)
  end

  def get_ticket_number_by_registration_number(registration_number)
    tickets.each_with_index do |car, index|
      return "T#{index + 1}" if car.reg_num == registration_number
    end

    nil
  end

  def get_ticket_numbers_by_color(color)
    result = []
    tickets.each_with_index do |car, index|
      result.push("T#{index + 1}") if car.color == color
    end

    print_data("Finding ticket Numbers By Color #{color}", result)
  end

  private

  def print_data(type, data)
    puts "#{type} :- "
    data.each do |item|
      puts item
    end
  end
end
