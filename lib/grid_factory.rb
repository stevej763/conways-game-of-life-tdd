class GridFactory
  def build(row_count, cells_per_row)
    grid = []
    row_count.times do |row_number|
      grid << [] #add a new empty row
      cells_per_row.times do
        grid[row_number] << Cell.new() #add a new initalized (dead) cell into the row (cells_per_row)
      end
    end
    return grid
  end
end