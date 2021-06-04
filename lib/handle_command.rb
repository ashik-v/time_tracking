require_relative "create_project"
require_relative "delete_project"
require_relative "start_timer"
require_relative "end_timer"
require_relative "edit_timer"

class HandleCommand < Struct.new(:projects)
  def handle_command(command)
    case command
    when /^c/
      CreateProject.new(projects).run
    when /^d/
      DeleteProject.new(projects).run
    when /^b/
      StartTimer.new(projects).run
    when /^e/
      EndTimer.new(projects).run
    when /^s/
      EditTimer.new(projects).run
    end
  end
end
