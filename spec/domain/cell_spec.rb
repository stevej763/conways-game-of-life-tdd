# frozen_string_literal: true

require 'domain/cell'

describe 'Cell' do

  describe 'cell is brought to life - .revive' do
    context 'given the cell is dead' do
      under_test = Cell.new
      it 'is alive and returns true' do
        under_test.revive
        expect(under_test.alive?).to eq(true)
      end
    end
  end

  describe 'cell is killed - .kill' do
    context 'given the cell is alive' do
      under_test = Cell.new
      under_test.kill
      it 'is dead and returns false' do
        expect(under_test.alive?).to eq(false)
      end
    end
  end

  describe '.is_alive?' do
    context 'given cell is alive' do
      under_test = Cell.new
      under_test.revive
      it 'it is alive and returns true' do
        expect(under_test.alive?).to eq(true)
      end
    end
    context 'given cell is dead' do
      under_test = Cell.new
      under_test.kill
      it 'it is alive and returns true' do
        expect(under_test.alive?).to eq(false)
      end
    end
  end

  describe '.display cell' do
    context 'given the cell is dead' do
      under_test = Cell.new
      under_test.kill
      it 'is displayed as unicode u26AB' do
        expect(under_test.display_cell).to eq("\u26AB")
      end
    end
    context 'given the cell is alive' do
      under_test = Cell.new
      under_test.revive
      it 'is displayed as unicode u26AA' do
        expect(under_test.display_cell).to eq("\u26AA")
      end
    end
  end
end
