require 'spec_helper'

describe 'Robot' do
  before do
    @robot = Robot.new
  end
  it "robot bearing" do
    directions = [ 'east', 'west', 'north', 'south' ]

    directions.each do |direction|
      @robot.orient(direction)
      expect(@robot.bearing).to eq direction
    end
  end
  it "invalid robot bearing" do
    expect {
      @robot.orient("foo")
      }.to raise_exception "Invalid Robot Bearing"
  end
  it "turn right from north" do 
    @robot.orient 'north'
    @robot.turn_right

    expect(@robot.bearing).to eq 'east'
  end
  it "turn right from east" do 
    @robot.orient 'east'
    @robot.turn_right

    expect(@robot.bearing).to eq 'south'
  end
  it "turn right from south" do 
    @robot.orient 'south'
    @robot.turn_right

    expect(@robot.bearing).to eq 'west'
  end
  it "turn right from west" do 
    @robot.orient 'west'
    @robot.turn_right

    expect(@robot.bearing).to eq 'north'
  end
  it "turn left from north" do 
    @robot.orient 'north'
    @robot.turn_left

    expect(@robot.bearing).to eq 'west'
  end
  it "turn left from east" do 
    @robot.orient 'east'
    @robot.turn_left

    expect(@robot.bearing).to eq 'north'
  end
  it "turn left from south" do 
    @robot.orient 'south'
    @robot.turn_left

    expect(@robot.bearing).to eq 'east'
  end
  it "turn left from west" do 
    @robot.orient 'west'
    @robot.turn_left

    expect(@robot.bearing).to eq 'south'
  end

  it "robot coordinates" do 
    @robot.at(3,0)
    expect(@robot.coordinates).to eq [3,0]
  end

  it "other robot coordinates" do 
    @robot.at(-2, 5)
    expect(@robot.coordinates).to eq [-2, 5]
  end
  
end