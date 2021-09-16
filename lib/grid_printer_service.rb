class GridPrinterService

  def print_visual_grid_from_array(grid)
    visual_grid = String.new
    grid.each_with_index do |row, row_index|
      row.each_with_index do |cell, column_index|
        visual_grid += cell.display_cell
      end
      visual_grid += "\n"
    end
    puts visual_grid
  end
  
end