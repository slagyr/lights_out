# This file, (styles.rb) inside a scene, should define any styles specific to the containing scene.
# It makes use of the StyleBuilder DSL.
#
# For more information see: http://limelightwiki.8thlight.com/index.php/A_Cook%27s_Tour_of_Limelight#Styling_with_styles.rb
# For a complete listing of style attributes see: http://limelightwiki.8thlight.com/index.php/Style_Attributes

board {
  background_image "images/board.png"
  width "100%"
  height "100%"
  top_padding 47
  horizontal_alignment :center
}

row {
  width "100%"
  height 63
#  left_padding 13
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
