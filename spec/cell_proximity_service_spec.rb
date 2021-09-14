require "cell_proximity_service"
require "grid_coordinate"
require "grid_factory"

describe 'CellProximityService' do
  context "A cell has no live neighbours" do
      cell = GridCoordinate.new(1,1)
      grid = GridFactory.new.build(3, 3)
      underTest = CellProximityService.new
    it "returns 0 living neighbours" do
      result = underTest.get_surrounding_cell_status(cell, grid)

      expect(result).to eq(0)
    end
  end
end