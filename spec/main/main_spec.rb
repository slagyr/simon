require File.expand_path(File.dirname(__FILE__) + "/../spec_helper")
require 'limelight/specs/spec_helper'

describe "Simon" do
  
  uses_scene :main
  
  it "should start a game" do
    game = mock("game")
    Game.should_receive(:new).and_return(game)
    game.should_receive(:start)
    
    scene.start_game
  end

  it "should open curtains" do
    scene.open_curtains
    
    scene.find("curtains").should == nil
  end
  
  it "should falsh" do
    scene.find('yellow').should_receive(:flash)
    scene.flash(:yellow)
        
    scene.find('red').should_receive(:flash)
    scene.flash(:red)
  end  
  
  it "should colse curtains" do
    scene.open_curtains
    scene.close_curtains("blah")
    
    curtains = scene.find("curtains")
    curtains.should_not == nil
    curtains.text.should == "blah"
  end
  
end
