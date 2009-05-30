require File.expand_path(File.dirname(__FILE__) + "/spec_helper")
require 'cell'

describe Cell do
  before(:each) do
    @cell = Cell.new
  end

  it "should be off" do
    @cell.should be_off
    @cell.should_not be_on
  end

  it "should toggle" do
    @cell.toggle
    @cell.should be_on
    @cell.should_not be_off

    @cell.toggle
    @cell.should be_off
    @cell.should_not be_on
  end

  it "should go on and off" do
    @cell.on!
    @cell.should be_on

    @cell.off!
    @cell.should be_off
  end
end