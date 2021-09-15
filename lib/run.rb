require './game_engine'
require './grid_factory'
require './cell_proximity_service'

grid = GridFactory.new.build(30,50)
game = GameEngine.new(grid, CellProximityService.new)

tub_seed = [
  GridCoordinate.new(0,0),
  GridCoordinate.new(0,2),
  GridCoordinate.new(1,1),
  GridCoordinate.new(2,0),
  GridCoordinate.new(2,2)
]

beacon_seed = [
  GridCoordinate.new(0,0),
  GridCoordinate.new(0,1),
  GridCoordinate.new(1,0),
  GridCoordinate.new(1,1),
  GridCoordinate.new(2,2),
  GridCoordinate.new(2,3),
  GridCoordinate.new(3,2),
  GridCoordinate.new(3,3)
]

i_column_seed = [
  GridCoordinate.new(5,8),
  GridCoordinate.new(5,9),
  GridCoordinate.new(5,10),
  GridCoordinate.new(6,8),
  GridCoordinate.new(6,10),
  GridCoordinate.new(7,8),
  GridCoordinate.new(7,9),
  GridCoordinate.new(7,10),
  GridCoordinate.new(8,8),
  GridCoordinate.new(8,9),
  GridCoordinate.new(8,10),
  GridCoordinate.new(9,8),
  GridCoordinate.new(9,9),
  GridCoordinate.new(9,10),
  GridCoordinate.new(10,8),
  GridCoordinate.new(10,9),
  GridCoordinate.new(10,10),
  GridCoordinate.new(11,8),
  GridCoordinate.new(11,10),
  GridCoordinate.new(12,8),
  GridCoordinate.new(12,9),
  GridCoordinate.new(12,10),
]

glider_seed = [
  GridCoordinate.new(0,1),
  GridCoordinate.new(1,2),
  GridCoordinate.new(2,0),
  GridCoordinate.new(2,1),
  GridCoordinate.new(2,2),
]

pulsar_seed = [
  GridCoordinate.new(5,3),
  GridCoordinate.new(6,3),
  GridCoordinate.new(7,3),

  GridCoordinate.new(5,8),
  GridCoordinate.new(6,8),
  GridCoordinate.new(7,8),

  GridCoordinate.new(3,5),
  GridCoordinate.new(3,6),
  GridCoordinate.new(3,7),

  GridCoordinate.new(8,5),
  GridCoordinate.new(8,6),
  GridCoordinate.new(8,7),
]

starting_x = 10
starting_y = 2
gospers_glider_gun_pulse = [
  GridCoordinate.new(starting_x,starting_y),
  GridCoordinate.new(starting_x,starting_y+1),
  GridCoordinate.new(starting_x+1,starting_y),
  GridCoordinate.new(starting_x+1,starting_y+1),

  GridCoordinate.new(starting_x,starting_y+10),
  GridCoordinate.new(starting_x+1,starting_y+10),
  GridCoordinate.new(starting_x+2,starting_y+10),

  GridCoordinate.new(starting_x-1,starting_y+11),
  GridCoordinate.new(starting_x+2,starting_y+10),

  GridCoordinate.new(starting_x-1,starting_y+11),
  GridCoordinate.new(starting_x+3,starting_y+11),

  GridCoordinate.new(starting_x-2,starting_y+12),
  GridCoordinate.new(starting_x+4,starting_y+12),
  GridCoordinate.new(starting_x-2,starting_y+13),
  GridCoordinate.new(starting_x+4,starting_y+13),

  GridCoordinate.new(starting_x+1,starting_y+14),

  GridCoordinate.new(starting_x-1,starting_y+15),
  GridCoordinate.new(starting_x+3,starting_y+15),

  GridCoordinate.new(starting_x,starting_y+16),
  GridCoordinate.new(starting_x+1,starting_y+16),
  GridCoordinate.new(starting_x+2,starting_y+16),

  GridCoordinate.new(starting_x+1,starting_y+17),


  GridCoordinate.new(starting_x,starting_y+20),
  GridCoordinate.new(starting_x-1,starting_y+20),
  GridCoordinate.new(starting_x-2,starting_y+20),
  GridCoordinate.new(starting_x,starting_y+21),
  GridCoordinate.new(starting_x-1,starting_y+21),
  GridCoordinate.new(starting_x-2,starting_y+21),

  GridCoordinate.new(starting_x-3,starting_y+22),
  GridCoordinate.new(starting_x+1,starting_y+22),

  GridCoordinate.new(starting_x+1,starting_y+24),
  GridCoordinate.new(starting_x+2,starting_y+24),
  GridCoordinate.new(starting_x-3,starting_y+24),
  GridCoordinate.new(starting_x-4,starting_y+24),

  GridCoordinate.new(starting_x-2,starting_y+35),
  GridCoordinate.new(starting_x-2,starting_y+34),
  GridCoordinate.new(starting_x-1,starting_y+35),
  GridCoordinate.new(starting_x-1,starting_y+34)
]


game.seed_game_grid(gospers_glider_gun_pulse)

tick = 0
puts game.get_printable_grid
loop do
  sleep 0.1
  puts game.run_game
  puts "".center(20, "-")
  tick += 1
end

