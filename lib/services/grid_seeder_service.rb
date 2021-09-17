# frozen_string_literal: true

class GridSeederService
  def seed_game_grid(cells_to_seed, grid)
    grid_array = grid
    cells_to_seed.each do |cell|
      grid[cell.get_x][cell.get_y].revive
    end
    grid_array
  end
end
