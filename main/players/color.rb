module Color
  
  attr_accessor :note
  
  def flash
    play_sound("sound/#{@note}.wav")
    color = style.secondary_background_color
    style.secondary_background_color = id.to_s
    style.gradient_penetration = "100"
    sleep(0.6)
    style.secondary_background_color = color
    style.gradient_penetration = "50"
  end
  
  def mouse_clicked(e)
    flash
    scene.game.color_pressed(id)
  end
  
end