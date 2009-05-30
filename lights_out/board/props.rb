5.times do |row|
  row do
    5.times do |col|
      cell :id => "#{row}, #{col}"
    end
  end
end
level :id => "level"
status :id => "status"
action :text => "Reset Level", :on_mouse_clicked => "scene.reset_level"
action :text => "Next Level", :on_mouse_clicked => "scene.next_level"
action :text => "New Game", :on_mouse_clicked => "scene.new_game"
