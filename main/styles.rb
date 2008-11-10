main {
  background_color :black
  horizontal_alignment :center
  vertical_alignment :center
  width "700"
  height "700"
}

color_button {
  width "350"
  height "350"
  margin 10
  background_color :white
  gradient_angle 270
  gradient :on
  gradient_penetration 50
}

red {
  extends :color_button
  secondary_background_color "700"
  top_left_rounded_corner_radius "330"
}

yellow {
  extends :color_button
  secondary_background_color "770"
  top_right_rounded_corner_radius "330"
}

blue {
  extends :color_button
  secondary_background_color "007"
  bottom_left_rounded_corner_radius "330"
}

green {
  extends :color_button
  secondary_background_color "070"
  bottom_right_rounded_corner_radius "330"
}

curtains {
  width "100%"
  height "100%"
  float :on
  background_color "#0008"
  font_size 50
  text_color :white
  vertical_alignment :center
  horizontal_alignment :center
}