class HandleCommand < Struct.new(:projects)
  COMMANDS = {
    "c" => Commands::CreateProject,
    "d" => Commands::DeleteProject,
    "b" => Commands::StartTimer,
    "e" => Commands::EndTimer,
    "s" => Commands::EditTimer,
  }

  def self.command_header
    COMMANDS.map { |key, command| "#{key} - #{command.description}" }
  end

  def handle_command(user_input)
    command = find_command(user_input)
    return puts("\nERROR: Invalid Command - enter valid command\n\n") unless command

    command.new(projects).run
  end

  def find_command(user_input)
    key = user_input[0]
    COMMANDS[key]
  end
end
