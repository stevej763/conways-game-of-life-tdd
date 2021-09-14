class GameEngine
  def initialize(grid)
   @grid = grid
  end

  def seed_game_grid(coordinates_to_seed)
    coordinates_to_seed.each do |coordinates|
      @grid[coordinates.get_x][coordinates.get_y].revive
    end
   end

  def run_next_tick
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