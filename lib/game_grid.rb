class GameGrid
  def initialize(grid, row_count, cells_per_row)
    @grid = grid
    @row_count= row_count
    @cells_per_row = cells_per_row
  end

  def get_grid_as_array
    return @grid
  end

  def get_row_count
    return @row_count
  end

  def get_cells_per_row
    return @cells_per_row
  end

end