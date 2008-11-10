class Sequence
  attr_accessor :colors
  
  COLORS = [:red, :yellow, :blue, :green]
  
  def initialize
    @colors = []
  end
  
  def new_color
    rand_index = rand(COLORS.size)
    @colors << COLORS[rand_index]
  end
  
  def on_track?(trial)
    i = 0
    trial.each do    
      return false if trial[i] != @colors[i]
      i += 1
    end
    return true
  end
  
  def matches?(trial)
    return trial === @colors
  end
end
