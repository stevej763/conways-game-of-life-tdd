class Cell

  attr_accessor :living_next_tick

  LIVING = "\u26AA".freeze
  DEAD = "\u26AB".freeze

  def initialize
    @alive = false
    @living_next_tick = false
  end

  def alive?
    @alive
  end

  def revive
    @alive = true
  end

  def kill
    @alive = false
  end

  def set_next_state(state)
    @living_next_tick = state
  end

  def update_to_next_state
    @alive = @living_next_tick
  end

  def display_cell
    @alive ? LIVING : DEAD
  end

  def ==(other)
    alive? == other.alive?
  end
end
