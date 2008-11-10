require 'game'

module Main
  
  attr_reader :game
  prop_reader :red, :yellow, :green, :blue
  
  def start_game
    @game = Game.new(self)
    @game.start
  end
  
  def open_curtains
    remove(find("curtains"))
  end
  
  def flash(color)
    self.send(color).flash  
  end
  
  def close_curtains(message)
    build do
      curtains :id => "curtains", :text => message
    end
  end
  
end