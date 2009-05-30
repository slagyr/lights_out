require 'grid'

class Game

  Levels = {
          1 => [[2, 0], [2, 2], [2, 4]],
          2 => [[0, 0], [0, 2], [0, 4], [1, 0], [1, 2], [1, 4], [3, 0], [3, 2], [3, 4], [4, 0], [4, 2], [4, 4]],
          3 => [[0, 1], [0, 3], [1, 0], [1, 1], [1, 3], [1, 4], [2, 0], [2, 1], [2, 3], [2, 4], [3, 0], [3, 1], [3, 3], [3, 4], [4, 1], [4, 3]],
          4 => [[1, 0], [1, 1], [1, 3], [1, 4], [3, 0], [3, 4], [4, 0], [4, 1], [4, 3], [4, 4]],
          5 => [[0, 0], [0, 1], [0, 2], [0, 3], [1, 0], [1, 1], [1, 2], [1, 4], [2, 0], [2, 1], [2, 2], [2, 4], [3, 3], [3, 4], [4, 0], [4, 1], [4, 3], [4, 4]]
  }

  attr_reader :grid, :level

  def initialize
    @grid = Grid.new
    setup_level(1)
  end

  def level_complete?
    return @grid.all_off?
  end

  def next_level
    setup_level(@level + 1) if @grid.all_off?
  end

  def reset_level
    setup_level(@level)
  end

  private #################################################

  def setup_level(level)
    @level = level
    @grid.cells.each { |cell| cell.off! }
    Levels[level].each do |coordinates|
      @grid.cell(coordinates[0], coordinates[1]).on!
    end
  end

end