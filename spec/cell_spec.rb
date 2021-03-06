require 'cell'

describe 'Cell' do

  describe "cell is brought to life - .revive" do
    context "given the cell is dead" do
      underTest = Cell.new()
      it "is alive and returns true" do
        underTest.revive
        expect(underTest.is_alive?).to eq(true)
      end
    end
  end

  describe "cell is killed - .kill" do
    context "given the cell is alive" do
      underTest = Cell.new()
      underTest.kill
      it "is dead and returns false" do
        expect(underTest.is_alive?).to eq(false)
      end
    end
  end

  describe ".is_alive?" do
    context "given cell is alive" do
      underTest = Cell.new()
      underTest.revive
      it "it is alive and returns true" do
        expect(underTest.is_alive?).to eq(true)
      end
    end
    context "given cell is dead" do
      underTest = Cell.new()
      underTest.kill
      it "it is alive and returns true" do
        expect(underTest.is_alive?).to eq(false)
      end
    end
  end

  describe ".display cell" do
    context "given the cell is dead" do
      underTest = Cell.new()
      underTest.kill
      it "is displayed as unicode u26AB" do
        expect(underTest.display_cell).to eq("\u26AB")
      end
    end
    context "given the cell is alive" do
      underTest = Cell.new()
      underTest.revive
      it "is displayed as unicode u26AA" do
        expect(underTest.display_cell).to eq("\u26AA")
      end
    end
  end
end