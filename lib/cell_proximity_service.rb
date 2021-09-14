class CellProximityService

  # def get_surrounding_cell_status(cell, grid)



  #   get_status(row_index -1, column_index -1) == true ? living_neighbours +=1 : nil
  #   get_status(row_index, column_index -1) == true ? living_neighbours +=1 : nil
  #   get_status(row_index +1, column_index -1) == true ? living_neighbours +=1 : nil
  #   get_status(row_index -1, column_index) == true ? living_neighbours +=1 : nil
  #   get_status(row_index +1, column_index) == true ? living_neighbours +=1 : nil
  #   get_status(row_index -1, column_index +1) == true ? living_neighbours +=1 : nil
  #   get_status(row_index, column_index +1) == true ? living_neighbours +=1 : nil
  #   get_status(row_index +1, column_index +1) == true ? living_neighbours +=1 : nil
  # end

  # def get_status(row, column)
  #   if row < 0 || column < 0
  #     return false
  #   elsif row > (@cells_per_row - 1) || column > (@row_count - 1)
  #     return false
  #   else
  #     return @grid[row][column].is_alive?
  #   end
  # end
end