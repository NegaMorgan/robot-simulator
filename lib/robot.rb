class Robot
  attr_reader :bearing, :coordinates
  VALID_DIRECTIONS = ['north','east','south','west']

  def orient(direction)
    raise "Invalid Robot Bearing" unless VALID_DIRECTIONS.include? direction
    @bearing = direction
  end
  def turn_right
    orient(VALID_DIRECTIONS[(VALID_DIRECTIONS.index(bearing)+1)%4])
  end
  def turn_left
    orient(VALID_DIRECTIONS[(VALID_DIRECTIONS.index(bearing)+3)%4])
  end
  def at(x, y)
    @coordinates = [x, y]
  end
end