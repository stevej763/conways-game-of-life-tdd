class GridCoordinate
  def initialize(x, y)
    @x = x
    @y = y
  end

  def get_x
    return @x
  end

  def get_y
    return @y
  end


  #   y    0 1 2
  #   x=0 [0 1 1]
  #   x=1 [1 0 1]
  #   x=2 [1 1 1]

  def get_top_left_neighbour()
    return GridCoordinate.new(@x - 1, @y - 1)
  end

  def get_top_neighbour()
    return GridCoordinate.new(@x - 1, @y)
  end

  def get_top_right_neighbour()
    return GridCoordinate.new(@x - 1, @y + 1)
  end

  def get_left_neighbour
    return GridCoordinate.new(@x, @y -1)
  end

  def get_right_neighbour
    return GridCoordinate.new(@x, @y +1)
  end

  def get_bottom_left_neighbour()
    return GridCoordinate.new(@x + 1, @y - 1)
  end

  def get_bottom_neighbour()
    return GridCoordinate.new(@x + 1, @y)
  end

  def get_bottom_right_neighbour()
    return GridCoordinate.new(@x + 1, @y + 1)
  end

  def ==(other)
    self.get_x == other.get_x && self.get_y == other.get_y
  end

  def to_s
    puts "X:#{@x}, Y:#{@y}"
  end

end