
require 'byebug'
class Character
  attr_reader :location, :velocity, :type

  def initialize(args)
    @type = args[:type]
    @velocity = args[:starting_v]
  end

  def passengers
    if @type == :car
      4
    else
      nil
    end
  end

  def to_s
    if @type == :person
      "[person]"
    elsif @type == :car
      "[car]"
    else
      error "Invalid type"
    end
  end

end

person = Character.new(type: :person, starting_v: 0)
puts person

car = Character.new(type: :car, starting_v: 0)
puts car
puts car.passengers

-------

class Character
  attr_reader :location, :velocity, :type
  def initialize(args)
    @velocity = args[:starting_v]
  end
end

class Car < Character
  attr_reader :passengers

  def initialize(args)
    @passengers = 4
    super
  end

  def to_s
    "[car with p=#{@passengers}, v=#{@velocity}]"
  end
end

class Person < Character
  def initialize(args)
    super(args)
  end

  def to_s
    "[Person v=#{@velocity}]"
  end
end

p = Person.new(starting_v: 0)
c = Car.new(starting_v: 0)

puts p
puts c

-------

class Character
  attr_reader :location, :velocity, :type, :speed_increment
  def initialize(args)
    @velocity = args[:starting_v]
  end

  def faster
    @velocity += speed_increment
  end

  def speed_increment
    raise "Subclass of Character should define speed_increment"
  end
end

class Car < Character
  attr_reader :passengers

  def initialize(args)
    @passengers = 4
    super
  end

  def speed_increment
    15
  end


  def to_s
    "[car with p=#{@passengers}, v=#{@velocity}]"
  end
end

class Person < Character
  def initialize(args)
    super(args)
  end

  def to_s
    "[Person v=#{@velocity}]"
  end

  def speed_increment
    3
  end
end

p = Person.new(starting_v: 0)
c = Car.new(starting_v: 0)

puts p
puts c

p.faster
c.faster

puts p
puts c

----

class Character
  attr_reader :location, :velocity
  def initialize(features)
    @features = features
    @velocity = @features.starting_v
    @speed_increment = @features.speed_increment
  end

  def faster
    @velocity += @speed_increment
  end

  def passengers
    @features.passengers
  end

  def to_s
    @features.to_s(self)
  end
end

class CarFeatures
  def speed_increment
    15
  end

  def starting_v
    0
  end

  def passengers
    4
  end

  def to_s(char)
    "[Car] s: #{char.velocity}, p: #{char.passengers}"
  end
end

class PersonFeatures
  def speed_increment
    3
  end

  def starting_v
    0
  end

  def passengers
    error "People don't have passengers!"
  end

  def to_s(char)
    "[Person] s: #{char.velocity}"
  end
end

p = Character.new(PersonFeatures.new)
c = Character.new(CarFeatures.new)

puts p
puts c

p.faster
c.faster

puts p
puts c
