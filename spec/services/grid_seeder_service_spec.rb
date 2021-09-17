require 'services/grid_seeder_service'
require 'domain/grid_factory'
require 'domain/grid_coordinate'

describe 'seed_game_grid' do
  under_test = GridSeederService.new
  context 'a dead grid' do
    grid = GridFactory.new.build(3, 3).get_grid_as_array
    coordinates_to_seed = [GridCoordinate.new(1, 1)]
    it 'sets cell 1,1 to alive' do
      result = under_test.seed_game_grid(coordinates_to_seed, grid)

      expect(result[1][1].alive?).to eq(true)
    end
  end

  context 'a dead grid' do
    grid = GridFactory.new.build(3, 3).get_grid_as_array
    coordinates_to_seed = [
      GridCoordinate.new(0, 0),
      GridCoordinate.new(1, 1)
    ]
    it 'set cell 1,1 and 0,0 to be alive' do
      result = under_test.seed_game_grid(coordinates_to_seed, grid)

      expect(result[1][1].alive?).to eq(true)
      expect(result[0][0].alive?).to eq(true)
    end
  end

  context 'a dead grid' do
    grid = GridFactory.new.build(3, 3).get_grid_as_array
    coordinates_to_seed = [
      GridCoordinate.new(0, 0),
      GridCoordinate.new(0, 1),
      GridCoordinate.new(0, 2),
      GridCoordinate.new(1, 0),
      GridCoordinate.new(1, 1),
      GridCoordinate.new(1, 2),
      GridCoordinate.new(2, 0),
      GridCoordinate.new(2, 1),
      GridCoordinate.new(2, 2)
    ]
    it 'set 9 cells to alive' do
      result = under_test.seed_game_grid(coordinates_to_seed, grid)

      expect(result[0][0].alive?).to eq(true)
      expect(result[0][1].alive?).to eq(true)
      expect(result[0][2].alive?).to eq(true)
      expect(result[1][0].alive?).to eq(true)
      expect(result[1][1].alive?).to eq(true)
      expect(result[1][2].alive?).to eq(true)
      expect(result[2][0].alive?).to eq(true)
      expect(result[2][1].alive?).to eq(true)
      expect(result[2][2].alive?).to eq(true)

    end
  end
end
