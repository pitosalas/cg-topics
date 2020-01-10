# A basic implementation of the Simple Car Gama

class Garage
  def initialize(name)
    @name = name
    @levels = []
  end

  def add_level(level)
    @levels << level
  end

  def arrive(vehicle)
    level = @levels.find { |l| l.max_height >= vehicle.height}
    level.park vehicle
  end

  def report
    puts @name
    @levels.each(&:report)
  end
end

class Level
  attr_reader :max_height
  def initialize(name, max_height)
    @vehicles = []
    @name = name
    @max_height = max_height
  end

  def park vehicle
    @vehicles << vehicle
  end

  def report
    puts "Level #{@name} with max height: #{@max_height}"
    @vehicles.each { |v| puts "v: #{v}" }
  end
end

class Vehicle
  attr_reader :height, :name
  def initialize(name, height)
    @name = name
    @height = height
  end

  def to_s
    "V: #{@name} height: #{@height} "
  end
end

class Car < Vehicle
end

class Police < Vehicle
end

my_garage = Garage.new("My Garage")
l1 = Level.new("Level 1", 60)
l2 = Level.new("Level 2", 100)
my_garage.add_level(l1)
my_garage.add_level(l2)

car1 = Car.new("Car one", 51)
car2 = Car.new("Car two", 80)
car3 = Car.new("Car three", 55)
police = Police.new("Police", 85)

my_garage.arrive(car1)
my_garage.arrive(car2)
my_garage.arrive(car3)
my_garage.arrive(police)

my_garage.report
