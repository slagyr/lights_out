# This file (production.rb) is the first file loaded opening a production.  It must define a module named 'Production'.
# The containing production will acquire all the behavior defined in this module.
# You may define serveral hooks and initialization steps here.

module Production

  attr_reader :game

#  # Define this method if you want the production name to be different from the default, directory name.
#  def name
#    return Lights Out
#  end
#
  # Hook #1.  Called when the production is newly created, before any loading has been done.
  # This is a good place to require needed files and instantiate objects in the busines layer.
  def production_opening
    $: << File.expand_path(File.dirname(__FILE__) + "/../lib")
    $: << File.expand_path(File.dirname(__FILE__) + "/lib")
    require 'game'
  end
#
#  # Hook #2.  Called after internal gems have been loaded and stages have been instantiated.
#  def production_loaded
#  end
#
  # Hook #3.  Called when the production has fully opened.
  def production_opened
    @board = theater['default'].current_scene
    @board.new_game if @board.respond_to?(:new_game)
  end
#
#  # The system will call this methods when it wishes to close the production, perhaps when the user quits the
#  # application.  By default the production will always return true. You may override this behavior by re-implenting
#  # the methods here.
#  def allow_close?
#    return true
#  end
#
#  # Called when the production is about to be closed.
#  def production_closing
#  end
#
#  # Called when the production is fully closed.
#  def production_closed
#  end

end