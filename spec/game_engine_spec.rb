require 'grid_factory'
require 'game_grid'
require 'game_engine'
require 'grid_coordinate'
require 'cell_proximity_service'
require 'grid_printer_service'
require 'grid_seeder_service'

describe 'GameEngine' do
  dead_cell = Cell::DEAD
  live_cell = Cell::LIVING
  cell_proximity_service = CellProximityService.new
  grid_printer_service = GridPrinterService.new
  grid_seeder_service = GridSeederService.new

  describe '.run_next_tick' do

    describe 'cell death rules:' do

      context "Living cells with less than 2 neighbours die on the next tick" do
        number_of_columns = 3
        number_of_rows = 3
        grid = GridFactory.new.build(number_of_rows, number_of_columns)
        underTest = GameEngine.new(grid, cell_proximity_service, grid_printer_service, grid_seeder_service)
        underTest.seed_game_grid([GridCoordinate.new(1,1)])
  
        it "dies on next tick" do
          puts "Before:"
          puts underTest.get_printable_grid
          underTest.run_next_tick
          puts "After:"
          puts underTest.get_printable_grid
          expected = "#{dead_cell+dead_cell+dead_cell}\n#{dead_cell+dead_cell+dead_cell}\n#{dead_cell+dead_cell+dead_cell}\n"
          cell = underTest.get_grid_array[1][1]
          expect(cell.is_alive?).to eq(false)
        end
      end

      context "Living cells with more than 3 neighbours die on the next tick" do
        number_of_columns = 3
        number_of_rows = 3
        grid = GridFactory.new.build(number_of_rows, number_of_columns)
        underTest = GameEngine.new(grid, cell_proximity_service, grid_printer_service, grid_seeder_service)
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

          expect(underTest.get_grid_array[0][0].is_alive?).to eq(false)
          expect(underTest.get_grid_array[0][2].is_alive?).to eq(false)
          expect(underTest.get_grid_array[1][1].is_alive?).to eq(false)
          expect(underTest.get_grid_array[2][0].is_alive?).to eq(false)
          expect(underTest.get_grid_array[2][2].is_alive?).to eq(false)
        end
      end
    end

    describe 'cell revival rules:' do
      context "Dead cells with 3 neighbours live on the next tick" do
        number_of_columns = 3
        number_of_rows = 3
        grid = GridFactory.new.build(number_of_rows, number_of_columns)
        underTest = GameEngine.new(grid, cell_proximity_service, grid_printer_service, grid_seeder_service)
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
   
          expect(underTest.get_grid_array[1][1].is_alive?).to eq(true)
        end
      end
    end

    describe 'cell survival rules:' do
      context "Living cells with 2 neighbours live on the next tick" do
        number_of_columns = 3
        number_of_rows = 3
        grid = GridFactory.new.build(number_of_rows, number_of_columns)
        underTest = GameEngine.new(grid, cell_proximity_service, grid_printer_service, grid_seeder_service)
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

          expect(underTest.get_grid_array[1][1].is_alive?).to eq(true)
        end
      end

      context "Living cells with 3 neighbours live on the next tick" do
        number_of_columns = 3
        number_of_rows = 3
        grid = GridFactory.new.build(number_of_rows, number_of_columns)
        underTest = GameEngine.new(grid, cell_proximity_service, grid_printer_service, grid_seeder_service)
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

          expect(underTest.get_grid_array[1][2].is_alive?).to eq(true)
        end
      end

      context "A square of cells survives on the next tick" do
        number_of_columns = 4
        number_of_rows = 4
        grid = GridFactory.new.build(number_of_rows, number_of_columns)
        underTest = GameEngine.new(grid, cell_proximity_service, grid_printer_service, grid_seeder_service)
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

          expect(underTest.get_grid_array[1][1].is_alive?).to eq(true)
          expect(underTest.get_grid_array[1][2].is_alive?).to eq(true)
          expect(underTest.get_grid_array[2][1].is_alive?).to eq(true)
          expect(underTest.get_grid_array[2][2].is_alive?).to eq(true)
        end
      end

      context "two seperate squares of cells survive on the next tick" do
        number_of_rows = 4
        number_of_columns = 7
        grid = GridFactory.new.build(number_of_rows, number_of_columns)
        underTest = GameEngine.new(grid, cell_proximity_service, grid_printer_service, grid_seeder_service)
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

          expect(underTest.get_grid_array[1][1].is_alive?).to eq(true)
          expect(underTest.get_grid_array[1][2].is_alive?).to eq(true)
          expect(underTest.get_grid_array[2][1].is_alive?).to eq(true)
          expect(underTest.get_grid_array[2][2].is_alive?).to eq(true)

          expect(underTest.get_grid_array[1][4].is_alive?).to eq(true)
          expect(underTest.get_grid_array[1][5].is_alive?).to eq(true)
          expect(underTest.get_grid_array[2][4].is_alive?).to eq(true)
          expect(underTest.get_grid_array[2][5].is_alive?).to eq(true)
        end
      end
    end
  end
end