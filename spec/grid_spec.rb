require File.expand_path(File.dirname(__FILE__) + "/spec_helper")
require 'grid'

describe Grid do
  before(:each) do
    @grid = Grid.new
  end

  it "should have all lights out at first" do
    @grid.cells.length.should == 25
    @grid.cells.each do |cell|
      cell.should be_off
    end
  end

  it "should return a cell" do
    @grid.cell(0, 0).should be(@grid.cells[0])
    @grid.cell(4, 4).should be(@grid.cells[24])
    @grid.cell(2, 2).should be(@grid.cells[12])
    @grid.cell(0, 4).should be(@grid.cells[4])
    @grid.cell(4, 0).should be(@grid.cells[20])
  end

  it "should raise error on bad cells" do
    lambda { @grid.cell(-1, 0) }.should raise_error
    lambda { @grid.cell(0, -1) }.should raise_error
    lambda { @grid.cell(5, 0) }.should raise_error
    lambda { @grid.cell(0, 5) }.should raise_error
  end

  # 0 - - - - -
  # 1 - - + - -
  # 2 - + + + -
  # 3 - - + - -
  # 4 - - - - -
  #   0 1 2 3 4
  it "should press the middle cell" do
    @grid.press(2, 2)
    @grid.lighted_cells.should == [[1, 2], [2, 1], [2, 2], [2, 3], [3, 2]]
  end

  # 0 - - - - -
  # 1 - - - - -
  # 2 - - - - -
  # 3 - - - - +
  # 4 - - - + +
  #   0 1 2 3 4
  it "should toggle bottom right corner" do
    @grid.press(4, 4)
    @grid.lighted_cells.should == [[3, 4], [4, 3], [4, 4]]
  end
  
  # 0 + - - - -
  # 1 - + + - -
  # 2 - + - - -
  # 3 - - - - -
  # 4 - - - - -
  #   0 1 2 3 4
  it "should press when some lights are already on" do
    @grid.press(0, 0)
    @grid.press(1, 1)
    @grid.lighted_cells.should == [[0, 0], [1, 1], [1, 2], [2, 1]]
  end

  it "should know when they're all off" do
    @grid.should be_all_off

    @grid.press(2, 2)
    @grid.should_not be_all_off

    @grid.press(2, 2)
    @grid.should be_all_off
  end

end