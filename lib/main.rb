require_relative "car"
require_relative "parking_lot"
require_relative "ticket"

# create car objects with registration number and color
puts "Creating Cars"
c1 = Car.new("HR-31-1000", "white")
c2 = Car.new("HR-31-2000", "red")
c3 = Car.new("HR-31-3000", "white")
c4 = Car.new("HR-31-4000", "black")
total_cars = [c1, c2, c3, c4]

#create parking log with specfic size
pl = ParkingLot.new(6)
puts "Parking cars in the available slots"
total_cars.each do |car|
  print "Next available slot is ", pl.next_available_slot, "\n"
  pl.park(car, pl.next_available_slot)
end

# Task - 1
# Registration numbers of all cars of a particular Color.
pl.get_registration_numbers_by_color("white")

# Task - 2
# Ticket number in which a car with a given registration number is placed.
registration_number = "HR-31-4000"
puts "Finding ticket number by registration number #{registration_number}", pl.get_ticket_number_by_registration_number(registration_number)

# Task - 3
# Ticket numbers of all ticket where a car of a particular color is placed.
pl.get_ticket_numbers_by_color("white")
