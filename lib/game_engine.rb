require_relative 'grid_coordinate'
require_relative 'grid_printer_service'

class GameEngine
  def initialize(grid, cell_proximity_service, grid_printer_service)
   @grid = grid
   @cell_proximity_service = cell_proximity_service
   @grid_printer_service = grid_printer_service
  end

  def seed_game_grid(coordinates_to_seed)
    coordinates_to_seed.each do |coordinates|
      @grid.get_grid_as_array[coordinates.get_x][coordinates.get_y].revive
    end
  end

  def get_grid
    return @grid
  end

  def get_grid_array
    return @grid.get_grid_as_array
  end

  def get_printable_grid
    @grid_printer_service.print_visual_grid_from_array(@grid.get_grid_as_array)
  end

  def run_next_tick
    @grid.get_grid_as_array.each_with_index do |row, row_index|
      row.each_with_index do |cell, column_index|
        cell_position = GridCoordinate.new(row_index, column_index)
        living_neighbours = @cell_proximity_service.get_surrounding_cell_status(cell_position, @grid)
        implementSurvivalRules(cell, living_neighbours, cell_position)
      end
    end
    update_grid
  end

  def run_game
    run_next_tick
    return get_printable_grid 
  end

  def update_grid
    @grid.get_grid_as_array.each_with_index do |row, row_index|
      row.each_with_index do |cell, column_index|
        cell.update_to_next_state
      end
    end
  end

  def implementSurvivalRules(cell, living_neighbours, cell_position)
    if cell.is_alive? && (living_neighbours < 2)
      cell.set_next_state(false)
    elsif cell.is_alive? && living_neighbours > 3
      cell.set_next_state(false)
    elsif cell.is_alive? && (living_neighbours == 2 || living_neighbours == 3)
      cell.set_next_state(true)
    elsif !cell.is_alive? && living_neighbours == 3
      cell.set_next_state(true)
    end
  end
end