require 'domain/grid_coordinate'

describe 'GridCoordinate' do
  describe '.get_top_left_neighbour' do
    context 'cell is at [1,1]' do
      under_test = GridCoordinate.new(1, 1)
      it 'returns [0,0]' do
        result = under_test.get_top_left_neighbour
        expect(result).to eq(GridCoordinate.new(0, 0))
      end
    end
  end

  describe '.get_top_neighbour' do
    context 'cell is at [1,1]' do
      under_test = GridCoordinate.new(1, 1)
      it 'returns [0,1]' do
        result = under_test.get_top_neighbour
        expect(result).to eq(GridCoordinate.new(0, 1))
      end
    end
  end

  describe '.get_top_right_neighbour' do
    context 'cell is at [1,1]' do
      under_test = GridCoordinate.new(1, 1)
      it 'returns [0,2]' do
        result = under_test.get_top_right_neighbour
        expect(result).to eq(GridCoordinate.new(0, 2))
      end
    end
  end

  describe '.get_left_neighbour' do
    context 'cell is at [1,1]' do
      under_test = GridCoordinate.new(1, 1)
      it 'returns [1,0]' do
        result = under_test.get_left_neighbour
        expect(result).to eq(GridCoordinate.new(1, 0))
      end
    end
  end
  describe '.get_right_neighbour' do
    context 'cell is at [1,1]' do
      under_test = GridCoordinate.new(1, 1)
      it 'returns [1,2]' do
        result = under_test.get_right_neighbour
        expect(result).to eq(GridCoordinate.new(1, 2))
      end
    end
  end


  describe '.get_bottom_left_neighbour' do
    context 'cell is at [1,1]' do
      under_test = GridCoordinate.new(1, 1)
      it 'returns [2,0]' do
        result = under_test.get_bottom_left_neighbour
        expect(result).to eq(GridCoordinate.new(2, 0))
      end
    end
  end

  describe '.get_bottom_neighbour' do
    context 'cell is at [1,1]' do
      under_test = GridCoordinate.new(1, 1)
      it 'returns [2,1]' do
        result = under_test.get_bottom_neighbour
        expect(result).to eq(GridCoordinate.new(2, 1))
      end
    end
  end

  describe '.get_bottom_right_neighbour' do
    context 'cell is at [1,1]' do
      under_test = GridCoordinate.new(1, 1)
      it 'returns [2,2]' do
        result = under_test.get_bottom_right_neighbour
        expect(result).to eq(GridCoordinate.new(2, 2))
      end
    end
  end
end
