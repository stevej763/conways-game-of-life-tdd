require 'game_grid'
require 'grid_factory'

describe 'GameGrid' do
  
  describe 'get_grid_as_array' do
    context "with 3 rows and 3 columns" do
      number_of_rows = 3
      number_of_columns = 3
      grid = GridFactory.new.build(number_of_rows, number_of_columns)
      underTest = GameGrid.new(grid, number_of_rows, number_of_columns)
      result = underTest.get_grid_as_array()
      it "has #{number_of_rows} rows" do
        expect(result.length).to eq(number_of_rows)
      end
      context "has #{number_of_columns} columns in each row" do
        result.each_with_index do |row, index|
          it "row #{index +1} has #{number_of_columns} columns" do
            expect(row.length).to eq(number_of_columns)
          end
        end
      end
    end
    context 'with 5 rows and 5 columns' do
      number_of_rows = 5
      number_of_columns = 5
      grid = GridFactory.new.build(number_of_rows, number_of_columns)
      underTest = GameGrid.new(grid, number_of_rows, number_of_columns)
      result = underTest.get_grid_as_array
      it "has #{number_of_rows} rows" do
        expect(result.length).to eq(number_of_rows)
      end
      context "has #{number_of_columns} columns in each row" do
        result.each_with_index do |row, index| 
          it "row #{index +1} has #{number_of_columns} columns" do
            expect(row.length).to eq(number_of_columns)
          end
        end
      end
    end
    context 'with 10 rows and 10 columns' do
      number_of_rows = 10
      number_of_columns = 10
      grid = GridFactory.new.build(number_of_rows, number_of_columns)
      underTest = GameGrid.new(grid, number_of_rows, number_of_columns)
      result = underTest.get_grid_as_array
      it "has #{number_of_rows} rows" do
        expect(result.length).to eq(number_of_rows)
      end
      context "has #{number_of_columns} columns in each row" do
        result.each_with_index do |row, index| 
          it "row #{index +1} has #{number_of_columns} columns" do
            expect(row.length).to eq(number_of_columns)
          end
        end
      end
    end
    context 'with 200 rows and 200 columns' do
      number_of_rows = 200
      number_of_columns = 200
      grid = GridFactory.new.build(number_of_rows, number_of_columns)
      underTest = GameGrid.new(grid, number_of_rows, number_of_columns)
      result = underTest.get_grid_as_array
      it "has #{number_of_rows} rows" do
        expect(result.length).to eq(number_of_rows)
      end
      context "each row has #{number_of_columns} columns" do
        result.each_with_index do |row, index| 
          it "row #{index +1} has #{number_of_columns} columns" do
            expect(row.length).to eq(number_of_columns)
          end
        end
      end
    end
  end

  describe 'get_row_count' do

    context "returns the correct number of rows for an even grid" do
      number_of_rows = 5
      number_of_columns = 5
      grid = GridFactory.new.build(number_of_rows, number_of_columns)  
      underTest = GameGrid.new(grid, number_of_rows, number_of_columns)
      result = underTest.get_row_count
      
      it "has #{number_of_rows} rows" do
        expect(result).to eq(number_of_rows)
      end
    end
    context "returns the correct number of rows for an uneven grid" do
      number_of_rows = 5
      number_of_columns = 10
      grid = GridFactory.new.build(number_of_rows, number_of_columns)  
      underTest = GameGrid.new(grid, number_of_rows, number_of_columns)
      result = underTest.get_row_count
      
      it "has #{number_of_rows} rows" do
        expect(result).to eq(number_of_rows)
      end
    end
  end

  describe 'get_cells_per_row' do

    context "returns the correct number of cells per row for an even grid" do
      number_of_rows = 5
      number_of_columns = 5
      grid = GridFactory.new.build(number_of_rows, number_of_columns)  
      underTest = GameGrid.new(grid, number_of_rows, number_of_columns)
      result = underTest.get_cells_per_row
      
      it "has #{number_of_rows} cells per row" do
        expect(result).to eq(number_of_rows)
      end
    end
    context "returns the correct number of cells per row for an uneven grid" do
      number_of_rows = 5
      number_of_columns = 10
      grid = GridFactory.new.build(number_of_rows, number_of_columns)  
      underTest = GameGrid.new(grid, number_of_rows, number_of_columns)
      result = underTest.get_cells_per_row
      
      it "has #{number_of_columns} cells per row" do
        expect(result).to eq(number_of_columns)
      end
    end
  end
end