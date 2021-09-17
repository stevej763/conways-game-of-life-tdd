require_relative '../lib/game_engine'
require_relative '../lib/domain/grid_factory'
require_relative '../lib/domain/game_grid'
require_relative '../lib/domain/grid_coordinate'
require_relative '../lib/services/cell_proximity_service'
require_relative '../lib/services/grid_printer_service'
require_relative '../lib/services/grid_seeder_service'
require_relative '../lib/services/cell_survival_service'

describe 'GameEngine' do
  cell_proximity_service = CellProximityService.new
  grid_printer_service = GridPrinterService.new
  grid_seeder_service = GridSeederService.new
  cell_survival_service = CellSurvivalService.new

  describe '.run_next_tick' do

    describe 'cell death rules:' do

      context 'Living cells with less than 2 neighbours die on the next tick' do
        number_of_columns = 3
        number_of_rows = 3
        grid = GridFactory.new.build(number_of_rows, number_of_columns)
        under_test = GameEngine.new(grid, cell_proximity_service, grid_printer_service, grid_seeder_service, cell_survival_service)
        under_test.seed_game_grid([GridCoordinate.new(1, 1)])

        it 'dies on next tick' do
          puts 'Before:'
          puts under_test.print_grid
          under_test.run_next_tick
          puts 'After:'
          puts under_test.print_grid

          cell = under_test.get_grid_array[1][1]
          expect(cell.alive?).to eq(false)
        end
      end

      context 'Living cells with more than 3 neighbours die on the next tick' do
        number_of_columns = 3
        number_of_rows = 3
        grid = GridFactory.new.build(number_of_rows, number_of_columns)
        under_test = GameEngine.new(grid, cell_proximity_service, grid_printer_service, grid_seeder_service, cell_survival_service)
        under_test.seed_game_grid(
          [
            GridCoordinate.new(0, 0),
            GridCoordinate.new(0, 2),
            GridCoordinate.new(1, 1),
            GridCoordinate.new(2, 0),
            GridCoordinate.new(2, 2)
          ]
        )

        it 'kills all 5 cells' do
          puts 'Before:'
          puts under_test.print_grid
          under_test.run_next_tick
          puts 'After:'
          puts under_test.print_grid

          expect(under_test.get_grid_array[0][0].alive?).to eq(false)
          expect(under_test.get_grid_array[0][2].alive?).to eq(false)
          expect(under_test.get_grid_array[1][1].alive?).to eq(false)
          expect(under_test.get_grid_array[2][0].alive?).to eq(false)
          expect(under_test.get_grid_array[2][2].alive?).to eq(false)
        end
      end
    end

    describe 'cell revival rules:' do
      context 'Dead cells with 3 neighbours live on the next tick' do
        number_of_columns = 3
        number_of_rows = 3
        grid = GridFactory.new.build(number_of_rows, number_of_columns)
        under_test = GameEngine.new(grid, cell_proximity_service, grid_printer_service, grid_seeder_service, cell_survival_service)
        under_test.seed_game_grid([
                                    GridCoordinate.new(0, 0),
                                    GridCoordinate.new(0, 2),
                                    GridCoordinate.new(2, 1)
                                  ])

        it "displays a #{number_of_rows}x#{number_of_columns} grid with no live cells" do
          puts 'Before:'
          puts under_test.print_grid
          under_test.run_next_tick
          puts 'After:'
          puts under_test.print_grid

          expect(under_test.get_grid_array[1][1].alive?).to eq(true)
        end
      end
    end

    describe 'cell survival rules:' do
      context 'Living cells with 2 neighbours live on the next tick' do
        number_of_columns = 3
        number_of_rows = 3
        grid = GridFactory.new.build(number_of_rows, number_of_columns)
        under_test = GameEngine.new(grid, cell_proximity_service, grid_printer_service, grid_seeder_service, cell_survival_service)
        under_test.seed_game_grid([
                                    GridCoordinate.new(0, 1),
                                    GridCoordinate.new(1, 1),
                                    GridCoordinate.new(2, 1)
                                  ])

        it "displays a #{number_of_rows}x#{number_of_columns} grid with the cell still alive" do
          puts 'Before:'
          puts under_test.print_grid
          under_test.run_next_tick
          puts 'After:'
          puts under_test.print_grid

          expect(under_test.get_grid_array[1][1].alive?).to eq(true)
        end
      end

      context 'Living cells with 3 neighbours live on the next tick' do
        number_of_columns = 3
        number_of_rows = 3
        grid = GridFactory.new.build(number_of_rows, number_of_columns)
        under_test = GameEngine.new(grid, cell_proximity_service, grid_printer_service, grid_seeder_service, cell_survival_service)
        under_test.seed_game_grid([
                                    GridCoordinate.new(0, 2),
                                    GridCoordinate.new(1, 1),
                                    GridCoordinate.new(1, 2),
                                    GridCoordinate.new(2, 2)
                                  ])

        it "displays a #{number_of_rows}x#{number_of_columns} grid with the cell still alive" do
          puts 'Before:'
          puts under_test.print_grid
          under_test.run_next_tick
          puts 'After:'
          puts under_test.print_grid

          expect(under_test.get_grid_array[1][2].alive?).to eq(true)
        end
      end

      context 'A square of cells survives on the next tick' do
        number_of_columns = 4
        number_of_rows = 4
        grid = GridFactory.new.build(number_of_rows, number_of_columns)
        under_test = GameEngine.new(grid, cell_proximity_service, grid_printer_service, grid_seeder_service, cell_survival_service)
        under_test.seed_game_grid([
                                    GridCoordinate.new(1, 1),
                                    GridCoordinate.new(1, 2),
                                    GridCoordinate.new(2, 1),
                                    GridCoordinate.new(2, 2)
                                  ])

        it "displays a #{number_of_rows}x#{number_of_columns} grid with the square of cells still alive" do
          puts 'Before:'
          puts under_test.print_grid
          under_test.run_next_tick
          puts 'After:'
          puts under_test.print_grid

          expect(under_test.get_grid_array[1][1].alive?).to eq(true)
          expect(under_test.get_grid_array[1][2].alive?).to eq(true)
          expect(under_test.get_grid_array[2][1].alive?).to eq(true)
          expect(under_test.get_grid_array[2][2].alive?).to eq(true)
        end
      end

      context 'two separate squares of cells survive on the next tick' do
        number_of_rows = 4
        number_of_columns = 7
        grid = GridFactory.new.build(number_of_rows, number_of_columns)
        under_test = GameEngine.new(grid, cell_proximity_service, grid_printer_service, grid_seeder_service, cell_survival_service)
        under_test.seed_game_grid([
                                    GridCoordinate.new(1, 1),
                                    GridCoordinate.new(1, 2),
                                    GridCoordinate.new(2, 1),
                                    GridCoordinate.new(2, 2),

                                    GridCoordinate.new(1, 4),
                                    GridCoordinate.new(1, 5),
                                    GridCoordinate.new(2, 4),
                                    GridCoordinate.new(2, 5)
                                  ])

        it "displays a #{number_of_rows}x#{number_of_columns} grid with both squares of cells still alive" do
          puts 'Before:'
          puts under_test.print_grid
          under_test.run_next_tick
          puts 'After:'
          puts under_test.print_grid

          expect(under_test.get_grid_array[1][1].alive?).to eq(true)
          expect(under_test.get_grid_array[1][2].alive?).to eq(true)
          expect(under_test.get_grid_array[2][1].alive?).to eq(true)
          expect(under_test.get_grid_array[2][2].alive?).to eq(true)

          expect(under_test.get_grid_array[1][4].alive?).to eq(true)
          expect(under_test.get_grid_array[1][5].alive?).to eq(true)
          expect(under_test.get_grid_array[2][4].alive?).to eq(true)
          expect(under_test.get_grid_array[2][5].alive?).to eq(true)
        end
      end
    end
  end
end
