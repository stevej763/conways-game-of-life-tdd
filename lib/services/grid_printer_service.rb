# frozen_string_literal: true

class GridPrinterService
  def print_visual_grid_from_array(grid)
    visual_grid = String.new
    grid.each do |row|
      row.each do |cell|
        visual_grid += cell.display_cell
      end
      visual_grid += "\n"
    end
    puts visual_grid
  end
end
