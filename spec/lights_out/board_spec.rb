require File.expand_path(File.dirname(__FILE__) + "/spec_helper")
require 'game'

describe "Board Scene" do

  uses_scene :board

  it "should create a new game" do
    scene.new_game    
    scene.game.should_not be_nil
    scene.level.text.should == "Level: 1"
    scene.status.text.should == "Remaining Lights: 3"
  end

  it "should handle a cell clicking" do
    scene.new_game
    scene.find("3, 0").mouse_clicked(nil)

    scene.status.text.should == "Remaining Lights: 5"
    scene.find("3, 0").style.background_image.should == "images/on.png"
  end

  it "should display a finished game" do
    scene.new_game
    scene.grid.cells.each { |cell| cell.off! }
    scene.refresh

    scene.status.text.should == "LEVEL COMPLETE!"
  end

  it "should reset the current level" do
    scene.new_game
    scene.find("3, 0").mouse_clicked(nil)

    scene.reset_level_button.mouse_clicked(nil)
    
    scene.status.text.should == "Remaining Lights: 3"
  end

  it "should go on to the next level" do
    scene.new_game
    scene.grid.cells.each { |cell| cell.off! }

    scene.next_level_button.mouse_clicked(nil)

    scene.level.text.should == "Level: 2"
  end

  it "should handle new game button pressed" do
    scene.new_game
    scene.grid.cells.each { |cell| cell.off! }
    scene.next_level_button.mouse_clicked(nil)
    scene.new_game_button.mouse_clicked(nil)

    scene.level.text.should == "Level: 1"
    scene.status.text.should == "Remaining Lights: 3"
  end

end