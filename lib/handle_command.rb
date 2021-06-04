class HandleCommand < Struct.new(:projects)
  def handle_command(command)
    case command
    when /^c/
      Commands::CreateProject
    when /^d/
      Commands::DeleteProject
    when /^b/
      Commands::StartTimer
    when /^e/
      Commands::EndTimer
    when /^s/
      Commands::EditTimer
    else
      puts "Invalid Command - enter command"
      return
    end.new(projects).run
  end
end
