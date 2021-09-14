require 'grid_factory'
require 'game_engine'

describe 'GameEngine' do
  dead_cell = Cell::DEAD
  live_cell = Cell::LIVING

  describe ".seed_game_grid" do
    context "set cell 1,1 to alive" do
      number_of_columns = 3
      number_of_rows = 3
      coordinates_to_seed = [{:x => 1, :y => 1}]
      grid = GridFactory.new.build(number_of_rows, number_of_columns)
      
      it "displays a #{number_of_rows}x#{number_of_columns} grid with one live cell at [1,1]" do
        underTest = GameEngine.new(grid)
        underTest.seed_game_grid(coordinates_to_seed)

        result = underTest.run_next_tick
        expected = "#{dead_cell+dead_cell+dead_cell}\n#{dead_cell+live_cell+dead_cell}\n#{dead_cell+dead_cell+dead_cell}\n"
        
        expect(result).to eq(expected)
      end
    end

    context "set cell 1,1 and 0,0 to alive" do
      number_of_columns = 3
      number_of_rows = 3
      coordinates_to_seed = [
        {:x => 0, :y => 0},
        {:x => 1, :y => 1}
      ]
      grid = GridFactory.new.build(number_of_rows, number_of_columns)

      it "displays a #{number_of_rows}x#{number_of_columns} grid with two live cells at [0,0] and [1,1]" do
        underTest = GameEngine.new(grid)
        underTest.seed_game_grid(coordinates_to_seed)
        
        result = underTest.run_next_tick
        expected = "#{live_cell+dead_cell+dead_cell}\n#{dead_cell+live_cell+dead_cell}\n#{dead_cell+dead_cell+dead_cell}\n"

        expect(result).to eq(expected)
      end
    end

    context "set 9 cells to alive" do
      number_of_columns = 3
      number_of_rows = 3
      grid = GridFactory.new.build(number_of_rows, number_of_columns)
      underTest = GameEngine.new(grid)
      coordinates_to_seed = [
        {:x => 0, :y => 0},
        {:x => 0, :y => 1},
        {:x => 0, :y => 2},
        {:x => 1, :y => 0},
        {:x => 1, :y => 1},
        {:x => 1, :y => 2},
        {:x => 2, :y => 0},
        {:x => 2, :y => 1},
        {:x => 2, :y => 2}
      ]
      expected = "#{live_cell+live_cell+live_cell}\n#{live_cell+live_cell+live_cell}\n#{live_cell+live_cell+live_cell}\n"
      result = underTest.seed_game_grid(coordinates_to_seed)
      it "displays a #{number_of_rows}x#{number_of_columns} grid with two live cells at [0,0] and [1,1]" do
        underTest = GameEngine.new(grid)
        underTest.seed_game_grid(coordinates_to_seed)
        result = underTest.run_next_tick
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
        underTest = GameEngine.new(grid)
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
        underTest = GameEngine.new(grid)
        result = underTest.run_next_tick
        expect(result).to eq(expected)
      end
    end
  end
end