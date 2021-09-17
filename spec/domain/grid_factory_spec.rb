require 'domain/grid_factory'

describe 'GridFactory' do

  describe 'build' do
    number_of_rows = 3
    number_of_columns = 3

    context "a #{number_of_rows}x#{number_of_columns} grid has been built" do
      under_test = GridFactory.new
      result = under_test.build(number_of_rows, number_of_columns)
      it "has #{number_of_rows} rows" do
        expect(result.get_row_count).to eq(number_of_rows)
      end

      it "has #{number_of_columns} columns" do
        expect(result.get_cells_per_row).to eq(number_of_columns)
      end
    end
  end
end
