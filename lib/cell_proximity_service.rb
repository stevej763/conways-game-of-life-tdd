class CellProximityService

  def get_surrounding_cell_status(coordinate, grid)
    living_neighbours = 0
    
    get_status_of_neighbour_cell_for(coordinate.get_top_left_neighbour.get_x, coordinate.get_top_left_neighbour.get_y, grid) == true ? living_neighbours += 1 : nil
    get_status_of_neighbour_cell_for(coordinate.get_top_neighbour.get_x, coordinate.get_top_neighbour.get_y, grid) == true ? living_neighbours += 1 : nil
    get_status_of_neighbour_cell_for(coordinate.get_top_right_neighbour.get_x, coordinate.get_top_right_neighbour.get_y, grid) == true ? living_neighbours += 1 : nil
    get_status_of_neighbour_cell_for(coordinate.get_left_neighbour.get_x, coordinate.get_left_neighbour.get_y, grid) == true ? living_neighbours += 1 : nil
    get_status_of_neighbour_cell_for(coordinate.get_right_neighbour.get_x, coordinate.get_right_neighbour.get_y, grid) == true ? living_neighbours += 1 : nil
    get_status_of_neighbour_cell_for(coordinate.get_bottom_left_neighbour.get_x, coordinate.get_bottom_left_neighbour.get_y, grid) == true ? living_neighbours += 1 : nil
    get_status_of_neighbour_cell_for(coordinate.get_bottom_neighbour.get_x, coordinate.get_bottom_neighbour.get_y, grid) == true ? living_neighbours += 1 : nil
    get_status_of_neighbour_cell_for(coordinate.get_bottom_right_neighbour.get_x, coordinate.get_bottom_right_neighbour.get_y, grid) == true ? living_neighbours += 1 : nil
    
    return living_neighbours
  end

  def get_status_of_neighbour_cell_for(row_index, cell_index, grid)
    if row_index < 0 || cell_index < 0
      return false
    elsif row_index > (grid.get_index_row_count) || cell_index > (grid.get_index_cells_per_row)
      return false
    else
      return grid.get_grid_as_array[row_index][cell_index].is_alive?
    end
  end
end