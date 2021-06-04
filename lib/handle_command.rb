class HandleCommand < Struct.new(:projects)
  def handle_command(command)
    command_class = find_command_class(command)
    return puts("\nERROR: Invalid Command - enter valid command\n\n") unless command_class

    command_class.new(projects).run
  end

  def find_command_class(command)
    case command
    when /^c/ then Commands::CreateProject
    when /^d/ then Commands::DeleteProject
    when /^b/ then Commands::StartTimer
    when /^e/ then Commands::EndTimer
    when /^s/ then Commands::EditTimer
    end
  end
end
