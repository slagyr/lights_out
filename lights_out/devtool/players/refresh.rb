module Refresh

  def mouse_clicked(e)
    scene = production.producer.open_scene('board', production.theater['default'])
    scene.new_game if scene.respond_to?(:new_game)
    scene.update
  end

end