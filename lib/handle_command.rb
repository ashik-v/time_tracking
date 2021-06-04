class HandleCommand < Struct.new(:projects)
  def handle_command(command)
    case command
    when /^c/
      Commands::CreateProject.new(projects).run
    when /^d/
      Commands::DeleteProject.new(projects).run
    when /^b/
      Commands::StartTimer.new(projects).run
    when /^e/
      Commands::EndTimer.new(projects).run
    when /^s/
      Commands::EditTimer.new(projects).run
    end
  end
end
