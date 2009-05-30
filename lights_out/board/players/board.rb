module Board

  attr_reader :grid
  prop_reader :status, :level

  def refresh
    find_by_name("cell").each { |cell| cell.on = @game.grid.cell(cell.row, cell.col).on? }
    if @game.level_complete?
      status.text = "LEVEL COMPLETE!"
    else
      status.text = "Remaining Lights: #{grid.lighted_cells.length}"
    end
    level.text = "Level: #{@game.level}"
  end

  def reset_level
    @game.reset_level
    refresh
  end

  def next_level
    @game.next_level
    refresh
  end

  def new_game
    @game = Game.new
    @grid = @game.grid
    refresh
  end

end