require 'drb'

Given /^that Lights Out is running$/ do
  Thread.new { system "jruby -S limelight open -d 9000 lights_out" }
  DRb.start_service
  while (@studio.nil?)
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
end

When /^I press light "([^\"]*)"$/ do |cell|
  @scene.find(cell).mouse_clicked(nil)
  @scene.update
  sleep(1)
end

Then /^all the lights should be off$/ do
  return @scene.grid.all_off?
end

Then /^the status should say "([^\"]*)"$/ do |text|
  return @scene.status.text == text
end

Then /^the game should be quitable$/ do
  @studio.shutdown
  return true
end

