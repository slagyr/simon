require File.expand_path(File.dirname(__FILE__) + "/spec_helper")
require 'game'
require 'sequence'

describe Game do
  
  before(:each) do
    @view = mock(:view, :null_object => true)
    @game = Game.new(@view)
  end
  
  it "should start a game" do
    @view.should_receive(:open_curtains)
    @view.should_receive(:flash)
    
    @game.start
    
    @game.sequence.should_not == nil
    @game.sequence.colors.length.should == 1
  end
  
  it "should record color presses" do
    @game.start
    @game.sequence.colors = [:red, :green]
    @game.stub!(:next_move)
    
    @game.color_pressed(:red)
    @game.color_pressed(:green)
    
    @game.played_colors.should == [:red, :green]
  end
  
  it "should ask the squence if played colors are on track" do
    @game.start
    @game.sequence.should_receive(:on_track?).with([:red])
    
    @game.color_pressed(:red)
  end
  
  it "should pull the curtains on a wrong move" do
    @game.start
    @game.sequence.colors = [:red, :green]
    @view.should_receive(:close_curtains).with("Score: 0\nClick to Play Again!")
    
    @game.color_pressed(:red)
    @game.color_pressed(:blue)
  end
  
end
