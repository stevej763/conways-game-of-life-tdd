class CellProximityService

  def get_surrounding_cell_status(coordinate, grid)
    grid_array = grid.get_grid_as_array
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
    elsif x > (grid.get_index_row_count) || y > (grid.get_index_cells_per_row)
      return false
    else
      return grid.get_grid_as_array[x][y].is_alive?
    end
  end
end