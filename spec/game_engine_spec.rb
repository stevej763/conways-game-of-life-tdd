require 'grid_factory'
require 'game_engine'

describe 'GameEngine' do

  describe 'run_next_tick' do
    context "A 3x3 grid with dead cells" do
      number_of_columns = 3
      number_of_rows = 3
      dead = Cell::DEAD
      grid = GridFactory.new.build(number_of_rows, number_of_columns)
      expected = "#{dead+dead+dead}\n#{dead+dead+dead}\n#{dead+dead+dead}\n"
      
      it "displays a #{number_of_rows}x#{number_of_columns} grid with dead cells" do
        underTest = GameEngine.new(grid)
        result = underTest.run_next_tick
        expect(result).to eq(expected)
      end
    end
  end
end