require 'game_grid'

describe 'GameGrid' do
  number_of_columns = 10
  number_of_rows = 10

  describe "build_grid" do
    context "a #{number_of_rows}x#{number_of_columns} grid has been built" do
      underTest = GameGrid.new(number_of_rows, number_of_columns)
      underTest.build_grid
      RESULT = underTest.get_grid
      it "has #{number_of_rows} rows" do
        expect(RESULT.length).to eq(10)
      end

      RESULT.each_with_index do |row, index| 
        it "row #{index} has #{number_of_columns} columns" do
          expect(row.length).to eq(10)
        end

        it "row #{index} contains cells" do
          expect(row).to all(be_a(Cell))
        end

        
      end
    end
  end
end