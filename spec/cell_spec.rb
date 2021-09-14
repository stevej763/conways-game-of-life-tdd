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
      it "it is alrive and returns true" do
        expect(underTest.is_alive?).to eq(false)
      end
    end
  end
end