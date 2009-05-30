module Cell

  def on=(value)
    if value
      style.background_image = "images/on.png"
    else
      style.background_image = "images/off.png"
    end
  end

  def row
    return id.split(',')[0].to_i
  end

  def col
    return id.split(',')[1].to_i
  end

  def mouse_clicked(e)
    scene.grid.press(row, col)
    scene.refresh
  end

end