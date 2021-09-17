# frozen_string_literal: true

class GridCoordinate

  def initialize(x, y)
    @x = x
    @y = y
  end

  def get_x
    @x
  end

  def get_y
    @y
  end

  def get_top_left_neighbour()
    GridCoordinate.new(@x - 1, @y - 1)
  end

  def get_top_neighbour()
    GridCoordinate.new(@x - 1, @y)
  end

  def get_top_right_neighbour()
    GridCoordinate.new(@x - 1, @y + 1)
  end

  def get_left_neighbour
    GridCoordinate.new(@x, @y - 1)
  end

  def get_right_neighbour
    GridCoordinate.new(@x, @y + 1)
  end

  def get_bottom_left_neighbour()
    GridCoordinate.new(@x + 1, @y - 1)
  end

  def get_bottom_neighbour()
    GridCoordinate.new(@x + 1, @y)
  end

  def get_bottom_right_neighbour()
    GridCoordinate.new(@x + 1, @y + 1)
  end

  def ==(other)
    self.get_x == other.get_x && self.get_y == other.get_y
  end

  def to_s
    "X:#{@x}, Y:#{@y}"
  end
end
