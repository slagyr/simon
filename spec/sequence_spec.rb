require File.expand_path(File.dirname(__FILE__) + "/spec_helper")
require 'sequence'

describe Sequence do
  
  before(:each) do
    @seq = Sequence.new
  end
  
  it "should be creatable" do
    @seq.should_not == nil
  end
  
  it "should create new colors" do
    @seq.new_color
    
    @seq.colors.length.should == 1
    [:red, :green, :blue, :yellow].should include(@seq.colors.first)
  end
  
  it "should create different colors" do
    100.times { @seq.new_color }
    @seq.colors.uniq.size.should > 1
  end
  
  it "should know if a played sequence is on track" do
    @seq.colors = [:red, :yellow, :green]
    
    @seq.on_track?([:red]).should == true
    @seq.on_track?([:red, :yellow]).should == true
    @seq.on_track?([:red, :yellow, :green]).should == true
    
    @seq.on_track?([:green]).should == false
    @seq.on_track?([:blue]).should == false
    @seq.on_track?([:red, :green]).should == false
    @seq.on_track?([:red, :yellow, :blue]).should == false
  end
  
  it "should know if a sequence matched" do
    @seq.colors = [:red]
    
    @seq.matches?([:red]).should == true
    @seq.matches?([:yellow]).should == false
    
    @seq.colors << :blue
    
    @seq.matches?([:red, :blue]).should == true
    @seq.matches?([:red]).should == false
    @seq.matches?([:red, :yellow]).should == false
  end
  
end