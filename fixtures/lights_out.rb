require 'drb'

module Fixtures


  class LightsOut

    def start_production
      Thread.new { system "jruby -S limelight open -d 9000 ../lights_out" }
      DRb.start_service
      while(@studio.nil?)
        @studio = DRbObject.new(nil, "druby://127.0.0.1:9000")
        begin
          @studio['lights_out']
        rescue
          @studio = nil
          sleep(0.1)
        end
      end
      sleep(4)
      production = @studio['lights_out']
      stage = production.theater['default']
      @scene = stage.current_scene
      return true
    end

    def press(name)
      @scene.find(name).mouse_clicked(nil)
      @scene.update
      sleep(1)
      return true
    end

    def level
      return @scene.level.text
    end

    def status
      return @scene.status.text
    end

    def close_production
      @studio.shutdown
      return true
    end

  end

end