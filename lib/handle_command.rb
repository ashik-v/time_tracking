class HandleCommand < Struct.new(:projects)
  COMMANDS = {
    "c" => Commands::CreateProject,
    "d" => Commands::DeleteProject,
    "b" => Commands::StartTimer,
    "e" => Commands::EndTimer,
    "s" => Commands::EditTimer,
  }

  def self.command_header
    COMMANDS.map { |command, command_class| "#{command} - #{command_class.description}" }
  end

  def handle_command(command)
    command_class = find_command_class(command)
    return puts("\nERROR: Invalid Command - enter valid command\n\n") unless command_class

    command_class.new(projects).run
  end

  def find_command_class(user_input)
    command = user_input[0]
    COMMANDS[command]
  end
end
