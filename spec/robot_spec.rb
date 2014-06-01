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

  it "advance when facing north" do
    @robot.at(0,0)
    @robot.orient('north')
    @robot.advance

    expect(@robot.coordinates).to eq [0,1]
  end
  it "advance when facing east" do
    @robot.at(0,0)
    @robot.orient('east')
    @robot.advance

    expect(@robot.coordinates).to eq [1,0]
  end
  it "advance when facing south" do
    @robot.at(0,0)
    @robot.orient('south')
    @robot.advance

    expect(@robot.coordinates).to eq [0,-1]
  end
  it "advance when facing west" do
    @robot.at(0,0)
    @robot.orient('west')
    @robot.advance

    expect(@robot.coordinates).to eq [-1,0]
  end

  it "instructions for turning left" do 
    expect(@robot.instructions('L')).to eq ["turn_left"]
  end
  it "instructions for turning right" do 
    expect(@robot.instructions('R')).to eq ["turn_right"]
  end
  it "instructions for advancing" do 
    expect(@robot.instructions('A')).to eq ["advance"]
  end
  it "series of instructions" do 
    expect(@robot.instructions('RAAL')).to eq ["turn_right", "advance", "advance", "turn_left"]
  end

  it "instruct robot" do 
    @robot.place({x: -2, y: 1, direction: "east"})
    @robot.evaluate 'RLAALAL'

    expect(@robot.coordinates).to eq [0,2]
    expect(@robot.bearing).to eq 'west'
  end
  it "instruct many robots" do 
    robot1 = Robot.new
    robot2 = Robot.new
    robot3 = Robot.new
    
    robot1.place({x: 0, y: 0, direction: "north"})
    robot2.place({x: 2, y: -7, direction: "east"})
    robot3.place({x: 8, y: 4, direction: "south"})
    robot1.evaluate("LAAARALA")
    robot2.evaluate("RRAAAAALA")
    robot3.evaluate("LAAARRRALLLL")

    expect(robot1.coordinates).to eq [-4, 1]
    expect(robot1.bearing).to eq "west"

    expect(robot2.coordinates).to eq [-3, -8]
    expect(robot2.bearing).to eq "south"

    expect(robot3.coordinates).to eq [11, 5]
    expect(robot3.bearing).to eq "north"
  end
  
end