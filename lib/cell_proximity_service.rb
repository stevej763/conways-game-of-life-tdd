class CellProximityService

  def get_surrounding_cell_status(coordinate, grid)
    living_neighbours = 0
    # puts "(CellProximityService)  x:#{coordinate.get_x} y:#{coordinate.get_y}"
    # # if coordinate.get_x == 1 && coordinate.get_y == 4
    # #   puts "top right: #{grid[1][5].is_alive?}"
    # #   puts "bottom left: #{grid[2][4].is_alive?}"
    # #   puts "bottom right: #{grid[2][5].is_alive?}"
    # #   puts living_neighbours
    # # end
    #  if coordinate.get_x == 1 && coordinate.get_y == 4
    #   puts "grid row count: #{grid.length}"
    #   puts "grid coloumn count: #{grid[0].length}"
    #   puts "neighbours of x:#{coordinate.get_x} y:#{coordinate.get_y} (top right of square)"
    #   puts "top right: #{grid[1][5].is_alive?}"
    #   puts "bottom left: #{grid[2][4].is_alive?}"
    #   puts "bottom right: #{grid[2][5].is_alive?}"

    #   puts "right neighbour x:#{coordinate.get_right_neighbour.get_x} y:#{coordinate.get_right_neighbour.get_y}"
    #   puts "bottom neighbour x:#{coordinate.get_bottom_neighbour.get_x} y:#{coordinate.get_bottom_neighbour.get_y}"
    #   puts "bottom right neighbour x:#{coordinate.get_bottom_right_neighbour.get_x} y:#{coordinate.get_bottom_right_neighbour.get_y}"
    #   puts living_neighbours
    # end
    
    get_status(coordinate.get_top_left_neighbour.get_x, coordinate.get_top_left_neighbour.get_y, grid) == true ? living_neighbours += 1 : nil
    get_status(coordinate.get_top_neighbour.get_x, coordinate.get_top_neighbour.get_y, grid) == true ? living_neighbours += 1 : nil
    get_status(coordinate.get_top_right_neighbour.get_x, coordinate.get_top_right_neighbour.get_y, grid) == true ? living_neighbours += 1 : nil
    get_status(coordinate.get_left_neighbour.get_x, coordinate.get_left_neighbour.get_y, grid) == true ? living_neighbours += 1 : nil
    get_status(coordinate.get_right_neighbour.get_x, coordinate.get_right_neighbour.get_y, grid) == true ? living_neighbours += 1 : nil
    get_status(coordinate.get_bottom_left_neighbour.get_x, coordinate.get_bottom_left_neighbour.get_y, grid) == true ? living_neighbours += 1 : nil
    get_status(coordinate.get_bottom_neighbour.get_x, coordinate.get_bottom_neighbour.get_y, grid) == true ? living_neighbours += 1 : nil
    get_status(coordinate.get_bottom_right_neighbour.get_x, coordinate.get_bottom_right_neighbour.get_y, grid) == true ? living_neighbours += 1 : nil
    
    return living_neighbours
  end

  def get_status(x, y, grid)
    # puts "x:#{x} y:#{y}"
    if x < 0 || y < 0
      # puts "negative out-of-bounds x:#{x} y:#{y}"
      return false
    elsif x > (grid.length-1) || y > (grid[0].length-1)
      # puts "positive out-of-bounds x:#{x} y:#{y}"
      return false
    else
      # puts " valid coordinate: x:#{x} y:#{y}"
      return grid[x][y].is_alive?
    end
  end
end