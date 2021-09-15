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

        result = underTest.get_printable_grid
        expected = "#{dead_cell+dead_cell+dead_cell}\n#{dead_cell+live_cell+dead_cell}\n#{dead_cell+dead_cell+dead_cell}\n"
        puts underTest.get_printable_grid
        expect(result).to eq(expected)
      end
    end

    context "set cell 1,1 and 0,0 to be alive" do
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
        puts underTest.get_printable_grid
        result = underTest.get_printable_grid
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
        puts underTest.get_printable_grid
        result = underTest.get_printable_grid
        expected = "#{live_cell+live_cell+live_cell}\n#{live_cell+live_cell+live_cell}\n#{live_cell+live_cell+live_cell}\n"
       
        expect(result).to eq(expected)
      end
    end
  end

  describe '.run_next_tick' do

    describe 'dead grids are generated on next tick' do

      context "A 3x3 grid with dead cells" do
        number_of_columns = 3
        number_of_rows = 3
        
        grid = GridFactory.new.build(number_of_rows, number_of_columns)
        expected = "#{dead_cell+dead_cell+dead_cell}\n#{dead_cell+dead_cell+dead_cell}\n#{dead_cell+dead_cell+dead_cell}\n"
  
        it "displays a #{number_of_rows}x#{number_of_columns} grid with dead cells" do
          underTest = GameEngine.new(grid, cell_proximity_service)
          underTest.run_next_tick
          result = underTest.get_printable_grid
          
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
          underTest.run_next_tick
          result = underTest.get_printable_grid
          
          expect(result).to eq(expected)
        end
      end
    end

    describe 'cell death rules:' do

      context "Living cells with less than 2 neighbours die on the next tick" do
        number_of_columns = 3
        number_of_rows = 3
        grid = GridFactory.new.build(number_of_rows, number_of_columns)
        underTest = GameEngine.new(grid, cell_proximity_service)
        underTest.seed_game_grid([GridCoordinate.new(1,1)])
  
        it "dies on next tick" do
          puts "Before:"
          puts underTest.get_printable_grid
          underTest.run_next_tick
          puts "After:"
          puts underTest.get_printable_grid
          expected = "#{dead_cell+dead_cell+dead_cell}\n#{dead_cell+dead_cell+dead_cell}\n#{dead_cell+dead_cell+dead_cell}\n"
          cell = underTest.get_grid[1][1]
          expect(cell.is_alive?).to eq(false)
        end
      end

      context "Living cells with more than 3 neighbours die on the next tick" do
        number_of_columns = 3
        number_of_rows = 3
        grid = GridFactory.new.build(number_of_rows, number_of_columns)
        underTest = GameEngine.new(grid, cell_proximity_service)
        underTest.seed_game_grid([
          GridCoordinate.new(0,0),
          GridCoordinate.new(0,2),
          GridCoordinate.new(1,1),
          GridCoordinate.new(2,0),
          GridCoordinate.new(2,2)
          ])

        it "kills all 5 cells" do
          puts "Before:"
          puts underTest.get_printable_grid
          underTest.run_next_tick
          puts "After:"
          puts underTest.get_printable_grid

          expect(underTest.get_grid[0][0].is_alive?).to eq(false)
          expect(underTest.get_grid[0][2].is_alive?).to eq(false)
          expect(underTest.get_grid[1][1].is_alive?).to eq(false)
          expect(underTest.get_grid[2][0].is_alive?).to eq(false)
          expect(underTest.get_grid[2][2].is_alive?).to eq(false)
        end
      end
    end

    describe 'cell revival rules:' do
      context "Dead cells with 3 neighbours live on the next tick" do
        number_of_columns = 3
        number_of_rows = 3
        grid = GridFactory.new.build(number_of_rows, number_of_columns)
        underTest = GameEngine.new(grid, cell_proximity_service)
        underTest.seed_game_grid([
          GridCoordinate.new(0,0),
          GridCoordinate.new(0,2),
          GridCoordinate.new(2,1)
          ])
  
        it "displays a #{number_of_rows}x#{number_of_columns} grid with no live cells" do
          puts "Before:"
          puts underTest.get_printable_grid
          underTest.run_next_tick
          puts "After:"
          puts underTest.get_printable_grid
   
          expect(underTest.get_grid[1][1].is_alive?).to eq(true)
        end
      end
    end

    describe 'cell survival rules:' do
      context "Living cells with 2 neighbours live on the next tick" do
        number_of_columns = 3
        number_of_rows = 3
        grid = GridFactory.new.build(number_of_rows, number_of_columns)
        underTest = GameEngine.new(grid, cell_proximity_service)
        underTest.seed_game_grid([
          GridCoordinate.new(0,1),
          GridCoordinate.new(1,1),
          GridCoordinate.new(2,1)
          ])
  
        it "displays a #{number_of_rows}x#{number_of_columns} grid with the cell still alive" do
          puts "Before:"
          puts underTest.get_printable_grid
          underTest.run_next_tick
          puts "After:"
          puts underTest.get_printable_grid

          expect(underTest.get_grid[1][1].is_alive?).to eq(true)
        end
      end

      context "Living cells with 3 neighbours live on the next tick" do
        number_of_columns = 3
        number_of_rows = 3
        grid = GridFactory.new.build(number_of_rows, number_of_columns)
        underTest = GameEngine.new(grid, cell_proximity_service)
        underTest.seed_game_grid([
          GridCoordinate.new(0,2),
          GridCoordinate.new(1,1),
          GridCoordinate.new(1,2),
          GridCoordinate.new(2,2)
          ])
  
        it "displays a #{number_of_rows}x#{number_of_columns} grid with the cell still alive" do
          puts "Before:"
          puts underTest.get_printable_grid
          underTest.run_next_tick
          puts "After:"
          puts underTest.get_printable_grid

          expect(underTest.get_grid[1][2].is_alive?).to eq(true)
        end
      end

      context "A square of cells survives on the next tick" do
        number_of_columns = 4
        number_of_rows = 4
        grid = GridFactory.new.build(number_of_rows, number_of_columns)
        underTest = GameEngine.new(grid, cell_proximity_service)
        underTest.seed_game_grid([
          GridCoordinate.new(1,1),
          GridCoordinate.new(1,2),
          GridCoordinate.new(2,1),
          GridCoordinate.new(2,2)
          ])
  
        it "displays a #{number_of_rows}x#{number_of_columns} grid with the square of cells still alive" do
          puts "Before:"
          puts underTest.get_printable_grid
          underTest.run_next_tick
          puts "After:"
          puts underTest.get_printable_grid

          expect(underTest.get_grid[1][1].is_alive?).to eq(true)
          expect(underTest.get_grid[1][2].is_alive?).to eq(true)
          expect(underTest.get_grid[2][1].is_alive?).to eq(true)
          expect(underTest.get_grid[2][2].is_alive?).to eq(true)
        end
      end

      context "two seperate squares of cells survive on the next tick" do
        number_of_rows = 4
        number_of_columns = 7
        grid = GridFactory.new.build(number_of_rows, number_of_columns)
        underTest = GameEngine.new(grid, cell_proximity_service)
        puts "Double square"
        underTest.seed_game_grid([
          GridCoordinate.new(1,1),
          GridCoordinate.new(1,2),
          GridCoordinate.new(2,1),
          GridCoordinate.new(2,2),

          GridCoordinate.new(1,4),
          GridCoordinate.new(1,5),
          GridCoordinate.new(2,4),
          GridCoordinate.new(2,5)
          ])
  
        it "displays a #{number_of_rows}x#{number_of_columns} grid with both squares of cells still alive" do
          puts "Before:"
          puts underTest.get_printable_grid
          underTest.run_next_tick
          puts "After:"
          puts underTest.get_printable_grid

          expect(underTest.get_grid[1][1].is_alive?).to eq(true)
          expect(underTest.get_grid[1][2].is_alive?).to eq(true)
          expect(underTest.get_grid[2][1].is_alive?).to eq(true)
          expect(underTest.get_grid[2][2].is_alive?).to eq(true)

          expect(underTest.get_grid[1][4].is_alive?).to eq(true)
          expect(underTest.get_grid[1][5].is_alive?).to eq(true)
          expect(underTest.get_grid[2][4].is_alive?).to eq(true)
          expect(underTest.get_grid[2][5].is_alive?).to eq(true)
        end
      end
    end
  end
end