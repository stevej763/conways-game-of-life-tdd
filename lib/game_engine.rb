require_relative 'domain/grid_coordinate'

class GameEngine
  def initialize(grid, cell_proximity_service, grid_printer_service, grid_seeder_service, survival_rule_service)
    @grid = grid
    @cell_proximity_service = cell_proximity_service
    @grid_printer_service = grid_printer_service
    @grid_seeder_service = grid_seeder_service
    @survival_rule_service = survival_rule_service
  end

  def seed_game_grid(coordinates_to_seed)
    @grid_seeder_service.seed_game_grid(coordinates_to_seed, get_grid_array)
  end

  def get_grid
    @grid
  end

  def get_grid_array
    @grid.get_grid_as_array
  end

  def print_grid
    @grid_printer_service.print_visual_grid_from_array(@grid.get_grid_as_array)
  end

  def run_next_tick
    get_grid_array.each_with_index do |row, row_index|
      row.each_with_index do |cell, column_index|
        cell_position = GridCoordinate.new(row_index, column_index)
        living_neighbours = @cell_proximity_service.get_surrounding_cell_status(cell_position, @grid)
        @survival_rule_service.implement_survival_rules(cell, living_neighbours)
      end
    end
    update_grid
  end

  def run_game
    run_next_tick
    print_grid
  end

  def update_grid
    get_grid_array.each do |row|
      row.each(&:update_to_next_state)
    end
  end

end
