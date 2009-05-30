class Cell

  def initialize
    @on = false
  end

  def on?
    return @on
  end

  def off?
    return !@on
  end

  def toggle
    @on = !@on
  end

  def on!
    @on = true
  end

  def off!
    @on = false
  end

end