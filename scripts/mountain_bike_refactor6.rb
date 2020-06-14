## BikeSpecs: Described fixed characteristics of different kinds of Mountain Bikes
class BikeSpec
  TIRE_WIDTH_FACTOR = 250
  FRONT_SUSPENSION_FACTOR = 100
  REAR_SUSPENSION_FACTOR = 150

  def initialize(tire_width: nil, front_fork_travel: nil, owner: nil)
    @commission = 0.25
    @base_price = 490
    @front_suspension_price = 95.0
    @rear_suspension_price = 78.0
    @tire_width = tire_width
    @front_fork_travel = front_fork_travel
    @owner = owner
  end
end

class RigidBikeSpec < BikeSpec
  def price
    (1 + @commission) * @base_price
  end

  def off_road_ability
    result = @tire_width * TIRE_WIDTH_FACTOR
  end

end

class FrontSuspensionBikeSpec < BikeSpec
  def off_road_ability
    result = @tire_width * TIRE_WIDTH_FACTOR
    result += @front_fork_travel * FRONT_SUSPENSION_FACTOR
  end

  def price
    (1 + @commission) * @base_price + @front_suspension_price
  end
end

class FullSuspensionBikeSpec < BikeSpec
  def off_road_ability
    result = @tire_width * TIRE_WIDTH_FACTOR
    result += @front_fork_travel * FRONT_SUSPENSION_FACTOR
    result += @rear_fork_travel * REAR_SUSPENSION_FACTOR
  end

  def price
    (1 + @commission) * @base_price + @front_suspension_price + @rear_suspension_price
  end
end


## Describes one particular bike
class MountainBike
  def initialize(bike_spec)
    @bike_spec = bike_spec
  end

  def off_road_ability
    @bike_spec.off_road_ability
  end
  
  def price
    @bike_spec.price
  end

  def owner
    @owner
  end

  def to_s
    "Mountain bike - owner: #{owner}, off road ability: #{off_road_ability()}, price: #{price}"
  end
end

# Test: Normally would be in a separate file
require 'minitest/autorun'

class TestMountainBike
  describe MountainBike do
    def setup
      @pitos_bike = MountainBike.new(RigidBikeSpec.new(owner: "Pito", tire_width: 2.5))
      @ricks_bike = MountainBike.new(FrontSuspensionBikeSpec.new(owner: "Rick", tire_width: 2.0, front_fork_travel: 3))
    end

    it "knows price of pitos_bike" do
      @pitos_bike.price.must_equal 612.5
    end

    it "knows offroad ability of pitos bike" do
      @pitos_bike.off_road_ability.must_equal 625
    end

    it "knows price of ricks_bike" do
      @ricks_bike.price.must_equal 707.5
    end

    it "knows offroad ability of ricks bike" do
      @ricks_bike.off_road_ability.must_equal 800
    end

  end
end
