class CellProximityService

  def get_surrounding_cell_status(coordinate, grid)
    living_neighbours = 0
    
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
    if x < 0 || y < 0
      return false
    elsif x > (grid.length-1) || y > (grid[0].length-1)
      return false
    else
      return grid[x][y].is_alive?
    end
  end
end