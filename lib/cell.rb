class Cell

  LIVING = "\u26AA"
  DEAD = "\u26AB"

  def initialize()
    @alive = false
    @living_next_tick
  end

  def is_alive?
    return @alive
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
    return @alive ? LIVING : DEAD
  end

  def ==(other)
    return self.is_alive? == other.is_alive?
  end

end