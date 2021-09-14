class GameEngine
  def initialize(grid)
   @grid = grid
  end

  def run_next_tick()
    visual_grid = String.new
    @grid.each_with_index do |row, row_index|
      row.each_with_index do |cell, column_index|
        visual_grid += cell.display_cell
      end
      visual_grid += "\n"
    end
    return visual_grid
  end
end