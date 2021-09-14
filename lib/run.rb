require './game_engine'
require './grid_factory'
require './cell_proximity_service'

grid = GridFactory.new.build(20,30)
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


game.seed_game_grid(pulsar_seed)


loop do
  sleep 0.3
  puts game.run_game
  puts "".center(20, "-")
end

# puts game.get_printable_grid