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

game.seed_game_grid(beacon_seed)
loop do
  sleep 0.3
  puts game.run_game
  puts "".center(20, "-")
end