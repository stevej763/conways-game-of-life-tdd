require "./lib/cell_proximity_service"
require "grid_coordinate"
require "grid_factory"

describe 'CellProximityService' do
  describe 'get_surrounding_cell_status' do
    context "A cell has no living neighbours" do
        cell = GridCoordinate.new(1,1)
        grid = GridFactory.new.build(3, 3)
        underTest = CellProximityService.new
      it "returns 0 living neighbours" do
        result = underTest.get_surrounding_cell_status(cell, grid)
  
        expect(result).to eq(0)
      end
    end

    context "A cell has one living neighbour" do
      cell = GridCoordinate.new(1,1)
      grid = GridFactory.new.build(3, 3)
      grid[0][0].revive
      underTest = CellProximityService.new
      it "returns 1" do
        result = underTest.get_surrounding_cell_status(cell, grid)
        expect(result).to eq(1)
      end
    end

    context "A cell has two living neighbour" do
      cell = GridCoordinate.new(1,1)
      grid = GridFactory.new.build(3, 3)
      grid[0][0].revive
      grid[0][1].revive
      underTest = CellProximityService.new
      it "returns 2" do
        result = underTest.get_surrounding_cell_status(cell, grid)
        expect(result).to eq(2)
      end
    end

    context "A cell has three living neighbour" do
      cell = GridCoordinate.new(1,1)
      grid = GridFactory.new.build(3, 3)
      grid[0][0].revive
      grid[0][1].revive
      grid[0][2].revive
      underTest = CellProximityService.new
      it "returns 3" do
        result = underTest.get_surrounding_cell_status(cell, grid)
        expect(result).to eq(3)
      end
    end

    context "A cell has four living neighbour" do
      cell = GridCoordinate.new(1,1)
      grid = GridFactory.new.build(3, 3)
      grid[0][0].revive
      grid[0][1].revive
      grid[0][2].revive
      grid[1][0].revive
      underTest = CellProximityService.new
      it "returns 4" do
        result = underTest.get_surrounding_cell_status(cell, grid)
        expect(result).to eq(4)
      end
    end

    context "A cell has five living neighbour" do
      cell = GridCoordinate.new(1,1)
      grid = GridFactory.new.build(3, 3)
      grid[0][0].revive
      grid[0][1].revive
      grid[0][2].revive
      grid[1][0].revive
      grid[1][2].revive
      underTest = CellProximityService.new
      it "returns 5" do
        result = underTest.get_surrounding_cell_status(cell, grid)
        expect(result).to eq(5)
      end
    end

    context "A cell has six living neighbour" do
      cell = GridCoordinate.new(1,1)
      grid = GridFactory.new.build(3, 3)
      grid[0][0].revive
      grid[0][1].revive
      grid[0][2].revive
      grid[1][0].revive
      grid[1][2].revive
      grid[2][0].revive
      underTest = CellProximityService.new
      it "returns 6" do
        result = underTest.get_surrounding_cell_status(cell, grid)
        expect(result).to eq(6)
      end
    end
    context "A cell has seven living neighbour" do
      cell = GridCoordinate.new(1,1)
      grid = GridFactory.new.build(3, 3)
      grid[0][0].revive
      grid[0][1].revive
      grid[0][2].revive
      grid[1][0].revive
      grid[1][2].revive
      grid[2][0].revive
      grid[2][1].revive
      underTest = CellProximityService.new
      it "returns 7" do
        result = underTest.get_surrounding_cell_status(cell, grid)
        expect(result).to eq(7)
      end
    end

    context "A cell has eight living neighbour" do
      cell = GridCoordinate.new(1,1)
      grid = GridFactory.new.build(3, 3)
      grid[0][0].revive
      grid[0][1].revive
      grid[0][2].revive
      grid[1][0].revive
      grid[1][2].revive
      grid[2][0].revive
      grid[2][1].revive
      grid[2][2].revive
      underTest = CellProximityService.new
      it "returns 8" do
        result = underTest.get_surrounding_cell_status(cell, grid)
        expect(result).to eq(8)
      end
    end

    context "A cell will mark out-of-bounds coordinates lower than minimum as dead" do
      cell = GridCoordinate.new(0,0)
      grid = GridFactory.new.build(3, 3)

      underTest = CellProximityService.new
      it "returns 0" do
        result = underTest.get_surrounding_cell_status(cell, grid)
        expect(result).to eq(0)
      end
    end

    context "A cell will mark out-of-bounds coordinates higher than maximum as dead" do
      cell = GridCoordinate.new(3,3)
      grid = GridFactory.new.build(3, 3)

      underTest = CellProximityService.new
      it "returns 0" do
        result = underTest.get_surrounding_cell_status(cell, grid)
        expect(result).to eq(0)
      end
    end
  end
end