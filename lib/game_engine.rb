require './grid_coordinate'

class GameEngine
  def initialize(grid, cell_proximity_service)
   @grid = grid
   @cell_proximity_service = cell_proximity_service
  end

  def seed_game_grid(coordinates_to_seed)
    coordinates_to_seed.each do |coordinates|
      @grid[coordinates.get_x][coordinates.get_y].revive
    end
  end

  def get_current_grid
    visual_grid = String.new
    @grid.each_with_index do |row, row_index|
      row.each_with_index do |cell, column_index|
        visual_grid += cell.display_cell
      end
      visual_grid += "\n"
    end
    return visual_grid
  end

  def run_next_tick
    @grid.each_with_index do |row, row_index|
      row.each_with_index do |cell, column_index|
        
        cell_position = GridCoordinate.new(row_index, column_index)
        living_neighbours = @cell_proximity_service.get_surrounding_cell_status(cell_position, @grid)
        if living_neighbours < 2
          cell.set_next_state(false)
        elsif cell.is_alive? && (living_neighbours == 2 || living_neighbours == 3)
          cell.set_next_state(true)
        elsif !cell.is_alive? && living_neighbours == 3
          cell.set_next_state(true)
        end
      end
    end
    update_grid
    return get_current_grid
  end

  def update_grid
    @grid.each_with_index do |row, row_index|
      row.each_with_index do |cell, column_index|
        cell.update_to_next_state
      end
    end
  end
end