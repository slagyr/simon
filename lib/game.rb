require 'sequence'

class Game
  
  attr_reader :sequence, :played_colors
  
  def initialize(view)
    @view = view
  end
  
  def start
    @score = -1
    @sequence = Sequence.new
    @view.open_curtains
    
    sleep(0.5) if !$TEST
    next_move
  end
  
  def next_move
    @sequence.new_color
    play_sequence
    @played_colors = []
    @score += 1  
  end
  
  def play_sequence
    @sequence.colors.each do |color|
      @view.flash(color)
      sleep(0.1) if !$TEST
    end
  end
  
  def color_pressed(color)
    @played_colors << color.to_sym
    if !@sequence.on_track?(@played_colors)
      game_over
    elsif @sequence.matches?(@played_colors)
      sleep(0.5) if !$TEST
      next_move
    end
  end
  
  def game_over
    @view.close_curtains("Score: #{@score}\nClick to Play Again!")
  end
  
end