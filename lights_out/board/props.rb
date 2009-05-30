5.times do |row|
  row do
    5.times do |col|
      cell :id => "#{row}, #{col}"
    end
  end
end
level :id => "level", :text => "Level: ?"
status :id => "status", :text => "No Game!"
action :text => "Reset Level", :id => "reset_level_button", :on_mouse_clicked => "scene.reset_level"
action :text => "Next Level", :id => "next_level_button", :on_mouse_clicked => "scene.next_level"
action :text => "New Game", :id => "new_game_button", :on_mouse_clicked => "scene.new_game"
