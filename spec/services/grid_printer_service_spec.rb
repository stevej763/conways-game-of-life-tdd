require 'services/grid_printer_service'
require 'domain/grid_factory'

describe 'GridPrinterService' do
  dead_cell = Cell::DEAD
  under_test = GridPrinterService.new

  describe '.print_visual_grid' do
    context 'should print grid in command line' do
      grid = GridFactory.new.build(3, 3).get_grid_as_array
      expected = "#{dead_cell + dead_cell + dead_cell}\n#{dead_cell + dead_cell + dead_cell}\n#{dead_cell + dead_cell + dead_cell}\n"
      it 'prints a 3x3 grid' do
        expect { under_test.print_visual_grid_from_array(grid) }.to output(expected).to_stdout
      end
    end
  end

  describe '.print_visual_grid' do
    context 'should print grid in command line' do

      grid = GridFactory.new.build(10, 3).get_grid_as_array
      expected = "#{dead_cell + dead_cell + dead_cell}\n#{dead_cell + dead_cell + dead_cell}\n#{dead_cell + dead_cell + dead_cell}\n#{dead_cell + dead_cell + dead_cell}\n#{dead_cell + dead_cell + dead_cell}\n#{dead_cell + dead_cell + dead_cell}\n#{dead_cell + dead_cell + dead_cell}\n#{dead_cell + dead_cell + dead_cell}\n#{dead_cell + dead_cell + dead_cell}\n#{dead_cell + dead_cell + dead_cell}\n"
      it 'prints a 3x10 grid' do
        expect { under_test.print_visual_grid_from_array(grid) }.to output(expected).to_stdout
      end
    end
  end
end
