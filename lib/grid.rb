require 'cell'

class Grid

  attr_reader :cells

  def initialize
    @cells = Array.new(25) { Cell.new }
  end

  def press(row, col)
    toggle_cell(row - 1, col)
    toggle_cell(row, col - 1)
    toggle_cell(row, col)
    toggle_cell(row, col + 1)
    toggle_cell(row + 1, col)
  end

  def cell(row, col)
    raise "invalid row: #{row}" if row < 0 || row > 4
    raise "invalid col: #{col}" if col < 0 || col > 4
    return @cells[row * 5 + col]
  end

  def all_off?
    return @cells.all? { |cell| cell.off? }
  end

  def lighted_cells
    result = []
    5.times do |row|
      5.times do |col|
        result << [row, col] if cell(row, col).on? 
      end
    end
    return result
  end

  private #################################################

  def toggle_cell(row, col)
    begin
      cell(row, col).toggle 
    rescue
    end
  end

end