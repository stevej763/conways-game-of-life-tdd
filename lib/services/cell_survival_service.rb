class CellSurvivalService

  def implement_survival_rules(cell, living_neighbours)
    if cell.alive? && living_neighbours < 2
      cell.set_next_state(false)
    elsif cell.alive? && living_neighbours > 3
      cell.set_next_state(false)
    elsif cell.alive? && living_neighbours == 2 || living_neighbours == 3
      cell.set_next_state(true)
    elsif !cell.alive? && living_neighbours == 3
      cell.set_next_state(true)
    end
  end
end
