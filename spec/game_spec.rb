require File.expand_path(File.dirname(__FILE__) + "/spec_helper")
require 'game'

describe Game do
  before(:each) do
    @game = Game.new
  end

  it "should have levels" do
    Game::Levels[1].should == [[2, 0], [2, 2], [2, 4]]
    Game::Levels[2].should == [[0, 0], [0, 2], [0, 4], [1, 0], [1, 2], [1, 4], [3, 0], [3, 2], [3, 4], [4, 0], [4, 2], [4, 4]]
    Game::Levels[3].should == [[0, 1], [0, 3], [1, 0], [1, 1], [1, 3], [1, 4], [2, 0], [2, 1], [2, 3], [2, 4], [3, 0], [3, 1], [3, 3], [3, 4], [4, 1], [4, 3]]
    Game::Levels[4].should == [[1, 0], [1, 1], [1, 3], [1, 4], [3, 0], [3, 4], [4, 0], [4, 1], [4, 3], [4, 4]]
    Game::Levels[5].should == [[0, 0], [0, 1], [0, 2], [0, 3], [1, 0], [1, 1], [1, 2], [1, 4], [2, 0], [2, 1], [2, 2], [2, 4], [3, 3], [3, 4], [4, 0], [4, 1], [4, 3], [4, 4]]
  end

  it "should start on Level 1" do
    @game.level.should == 1
    @game.grid.should_not == nil
    @game.grid.lighted_cells.should == Game::Levels[1]
  end

  it "should know when the level is complete" do
    @game.level_complete?.should == false

    @game.grid.cells.each { |cell| cell.off! }

    @game.level_complete?.should == true
  end

  it "should go to the next level" do
    @game.grid.cells.each { |cell| cell.off! }
    @game.next_level

    @game.level.should == 2
    @game.grid.lighted_cells.should == Game::Levels[2]
  end

  it "should not go to next level is the current level is incomplete" do
    @game.next_level

    @game.level.should == 1
  end

  it "should reset level" do
    @game.grid.cells.each { |cell| cell.off! }
    @game.reset_level

    @game.grid.lighted_cells.should == Game::Levels[1]
  end
end