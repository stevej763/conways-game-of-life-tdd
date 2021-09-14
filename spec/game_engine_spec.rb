require 'grid_factory'
require 'game_engine'
require 'grid_coordinate'
require 'cell_proximity_service'

describe 'GameEngine' do
  dead_cell = Cell::DEAD
  live_cell = Cell::LIVING
  cell_proximity_service = CellProximityService.new

  describe ".seed_game_grid" do
    context "set cell 1,1 to alive" do
      number_of_columns = 3
      number_of_rows = 3
      coordinates_to_seed = [GridCoordinate.new(1,1)]
      grid = GridFactory.new.build(number_of_rows, number_of_columns)
      
      it "displays a #{number_of_rows}x#{number_of_columns} grid with one live cell at [1,1]" do
        underTest = GameEngine.new(grid, cell_proximity_service)
        underTest.seed_game_grid(coordinates_to_seed)

        result = underTest.get_current_grid
        expected = "#{dead_cell+dead_cell+dead_cell}\n#{dead_cell+live_cell+dead_cell}\n#{dead_cell+dead_cell+dead_cell}\n"
        
        expect(result).to eq(expected)
      end
    end

    context "seed cell 1,1 and 0,0 to be alive" do
      number_of_columns = 3
      number_of_rows = 3
      coordinates_to_seed = [
        GridCoordinate.new(0,0),
        GridCoordinate.new(1,1)
      ]
      grid = GridFactory.new.build(number_of_rows, number_of_columns)

      it "displays a #{number_of_rows}x#{number_of_columns} grid with two live cells at [0,0] and [1,1]" do
        underTest = GameEngine.new(grid, cell_proximity_service)
        underTest.seed_game_grid(coordinates_to_seed)
        
        result = underTest.get_current_grid
        expected = "#{live_cell+dead_cell+dead_cell}\n#{dead_cell+live_cell+dead_cell}\n#{dead_cell+dead_cell+dead_cell}\n"

        expect(result).to eq(expected)
      end
    end

    context "set 9 cells to alive" do
      number_of_columns = 3
      number_of_rows = 3
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
      grid = GridFactory.new.build(number_of_rows, number_of_columns)

      it "displays a #{number_of_rows}x#{number_of_columns} grid with two live cells at [0,0] and [1,1]" do
        underTest = GameEngine.new(grid, cell_proximity_service)
        underTest.seed_game_grid(coordinates_to_seed)
        
        result = underTest.get_current_grid
        expected = "#{live_cell+live_cell+live_cell}\n#{live_cell+live_cell+live_cell}\n#{live_cell+live_cell+live_cell}\n"
       
        expect(result).to eq(expected)
      end
    end
  end

  describe '.run_next_tick' do

    context "A 3x3 grid with dead cells" do
      number_of_columns = 3
      number_of_rows = 3
      
      grid = GridFactory.new.build(number_of_rows, number_of_columns)
      expected = "#{dead_cell+dead_cell+dead_cell}\n#{dead_cell+dead_cell+dead_cell}\n#{dead_cell+dead_cell+dead_cell}\n"

      it "displays a #{number_of_rows}x#{number_of_columns} grid with dead cells" do
        underTest = GameEngine.new(grid, cell_proximity_service)
        result = underTest.run_next_tick
        
        expect(result).to eq(expected)
      end
    end

    context "A 5x5 grid with dead cells" do
      number_of_columns = 5
      number_of_rows = 5
      grid = GridFactory.new.build(number_of_rows, number_of_columns)
      expected = "#{dead_cell+dead_cell+dead_cell+dead_cell+dead_cell}\n#{dead_cell+dead_cell+dead_cell+dead_cell+dead_cell}\n#{dead_cell+dead_cell+dead_cell+dead_cell+dead_cell}\n#{dead_cell+dead_cell+dead_cell+dead_cell+dead_cell}\n#{dead_cell+dead_cell+dead_cell+dead_cell+dead_cell}\n"

      it "displays a #{number_of_rows}x#{number_of_columns} grid with dead cells" do
        underTest = GameEngine.new(grid, cell_proximity_service)
        result = underTest.run_next_tick
        
        expect(result).to eq(expected)
      end
    end

    context "a single live cell dies on next tick" do
      number_of_columns = 3
      number_of_rows = 3
      grid = GridFactory.new.build(number_of_rows, number_of_columns)
      underTest = GameEngine.new(grid, cell_proximity_service)
      underTest.seed_game_grid([GridCoordinate.new(1,1)])

      it "displays a #{number_of_rows}x#{number_of_columns} grid with one live cell" do
        underTest.run_next_tick
        expected = "#{dead_cell+dead_cell+dead_cell}\n#{dead_cell+dead_cell+dead_cell}\n#{dead_cell+dead_cell+dead_cell}\n"

        expect(underTest.get_current_grid).to eq(expected)
      end
    end

    # context "A cell with 2 neighbours lives on the next tick" do
    #   number_of_columns = 3
    #   number_of_rows = 3
    #   grid = GridFactory.new.build(number_of_rows, number_of_columns)
    #   underTest = GameEngine.new(grid, cell_proximity_service)
    #   underTest.seed_game_grid([
    #     GridCoordinate.new(0,1),
    #     GridCoordinate.new(1,1),
    #     GridCoordinate.new(2,1)
    #     ])

    #   it "displays a #{number_of_rows}x#{number_of_columns} grid with one live cell" do
    #     underTest.run_next_tick
    #     expected = "#{live_cell+live_cell+live_cell}\n#{dead_cell+dead_cell+dead_cell}\n#{dead_cell+dead_cell+dead_cell}\n"

    #     expect(underTest.get_current_grid).to eq(expected)
    #   end
    # end
  end
end