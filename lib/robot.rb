class Robot
  attr_reader :bearing, :coordinates
  VALID_DIRECTIONS = ['north','east','south','west']
  VALID_ACTIONS = {:L => 'turn_left', :R => 'turn_right', :A => 'advance'}

  def orient(direction)
    raise "Invalid Robot Bearing" unless VALID_DIRECTIONS.include? direction
    @bearing = direction
  end
  def turn(number)
    orient(VALID_DIRECTIONS[(VALID_DIRECTIONS.index(bearing)+number)%4])
  end
  def turn_right
    turn(1)
  end
  def turn_left
    turn(3)
  end
  def at(x, y)
    @coordinates = [x, y]
  end
  def advance
    x = coordinates[0]
    y = coordinates[1]

    case bearing
    when 'north'
      y += 1
    when 'east'
      x += 1
    when 'south'
      y -= 1
    when 'west'
      x -= 1
    end

    self.at(x, y)
  end
  def instructions(letters)
    letters.split("").map do |command| 
      VALID_ACTIONS[command.to_sym]
    end
  end
  def place(options)
    at options[:x], options[:y]
    orient options[:direction]
  end
  def evaluate(letters)
    letters.split("").each do |command| 
      self.send(VALID_ACTIONS[command.to_sym])
    end
  end
end