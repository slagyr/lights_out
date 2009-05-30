module Board

  attr_reader :game, :grid
  prop_reader :status, :level, :next_level_button, :reset_level_button, :new_game_button

  def refresh
    find_by_name("cell").each do |cell|
      cell.on = @game.grid.cell(cell.row, cell.col).on?
    end

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
    update
  end

end