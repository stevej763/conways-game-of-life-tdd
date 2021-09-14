require "grid_factory"

describe 'GridFactory' do

  describe "build" do
    number_of_rows = 3
    number_of_columns = 3

    context "a #{number_of_rows}x#{number_of_columns} grid has been built" do
      underTest = GridFactory.new()
      result = underTest.build(number_of_rows, number_of_columns)
      it "has #{number_of_rows} rows" do
        expect(result.length).to eq(number_of_rows)
      end

      result.each_with_index do |row, index| 
        it "row #{index +1} has #{number_of_columns} columns" do
          expect(row.length).to eq(number_of_columns)
        end
        it "row #{index + 1} contains dead cells" do
          expect(row).to all(be_a(Cell))
        end
      end
    end
  end
end