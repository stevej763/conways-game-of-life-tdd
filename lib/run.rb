require './game_engine'
require './grid_factory'
require './cell_proximity_service'

grid = GridFactory.new.build(10,10)
game = GameEngine.new(grid, CellProximityService.new)


seed = [
  GridCoordinate.new(0,0),
  GridCoordinate.new(0,2),
  GridCoordinate.new(1,1),
  GridCoordinate.new(2,0),
  GridCoordinate.new(2,2)
  ]

game.seed_game_grid(seed)
loop do
  sleep 0.5
  puts game.run_next_tick
  puts "".center(20, "-")
end