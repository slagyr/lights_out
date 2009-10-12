board {
#  background_color :blue
  background_image "images/board.png"
  width "100%"
  height "100%"
  top_padding 47
  horizontal_alignment :center
}
#
row {
  width "100%"
  height 63
  top_padding 3
  horizontal_alignment :center
}

cell {
  background_image "images/off.png"
  width 74
  height 60
  left_margin 8
  right_margin 8
}

status {
  width "100%"
  height 45
  font_size 20
  text_color :white
  horizontal_alignment :center
  vertical_alignment :center
}

level {
  extends :status
}

action {
  width 150
  height 53
  top_margin 20
  horizontal_alignment :center
  vertical_alignment :center
  text_color :white
  font_style "bold"
  background_image "images/button.png"
  hover {
    background_image "images/button_hover.png"
    text_color "#26a5da"
  }
}
