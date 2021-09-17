require 'services/cell_survival_service'
require 'domain/cell'

describe 'CellSurvivalService' do
  under_test = CellSurvivalService.new
  describe 'living cell' do
    context 'when living cell has no living neighbours' do
      cell = Cell.new
      cell.revive
      under_test.implement_survival_rules(cell, 0)
      it 'cell dies' do
        expect(cell.living_next_tick).to eq(false)
      end
    end

    context 'when living cell has one living neighbours' do
      cell = Cell.new
      cell.revive
      under_test.implement_survival_rules(cell, 1)
      it 'cell dies' do
        expect(cell.living_next_tick).to eq(false)
      end
    end

    context 'when living cell has two living neighbours' do
      cell = Cell.new
      cell.revive
      under_test.implement_survival_rules(cell, 2)
      it 'cell lives' do
        expect(cell.living_next_tick).to eq(true)
      end
    end
    context 'when living cell has three living neighbours' do
      cell = Cell.new
      cell.revive
      under_test.implement_survival_rules(cell, 3)
      it 'cell lives' do
        expect(cell.living_next_tick).to eq(true)
      end
    end
    context 'when living cell has four living neighbours' do
      cell = Cell.new
      cell.revive
      under_test.implement_survival_rules(cell, 4)
      it 'cell dies' do
        expect(cell.living_next_tick).to eq(false)
      end
    end
    context 'when living cell has more than 4 living neighbours' do
      cell = Cell.new
      cell.revive
      under_test.implement_survival_rules(cell, 5)
      it 'cell dies' do
        expect(cell.living_next_tick).to eq(false)
      end
    end
  end

  describe 'dead cell' do
    context 'when dead cell has no living neighbours' do
      cell = Cell.new
      under_test.implement_survival_rules(cell, 0)
      it 'cell stays dead' do
        expect(cell.living_next_tick).to eq(false)
      end
    end

    context 'when dead cell has one living neighbours' do
      cell = Cell.new
      under_test.implement_survival_rules(cell, 1)
      it 'cell stays dead' do
        expect(cell.living_next_tick).to eq(false)
      end
    end

    context 'when dead cell has two living neighbours' do
      cell = Cell.new
      under_test.implement_survival_rules(cell, 2)
      it 'cell stays dead' do
        expect(cell.living_next_tick).to eq(false)
      end
    end
    context 'when dead cell has three living neighbours' do
      cell = Cell.new
      under_test.implement_survival_rules(cell, 3)
      it 'cell lives' do
        expect(cell.living_next_tick).to eq(true)
      end
    end
    context 'when dead cell has four living neighbours' do
      cell = Cell.new
      under_test.implement_survival_rules(cell, 4)
      it 'cell stays dead' do
        expect(cell.living_next_tick).to eq(false)
      end
    end
    context 'when dead cell has more than 4 living neighbours' do
      cell = Cell.new
      under_test.implement_survival_rules(cell, 5)
      it 'cell stays dead' do
        expect(cell.living_next_tick).to eq(false)
      end
    end
  end
end
