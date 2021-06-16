class HandleCommand < Struct.new(:projects)
  COMMANDS = {
    "c" => ["create", Commands::CreateProject],
    "d" => ["delete", Commands::DeleteProject],
    "b" => ["begin timer", Commands::StartTimer],
    "e" => ["end timer", Commands::EndTimer],
    "s" => ["set duration", Commands::EditTimer],
  }

  def self.command_header
    COMMANDS.map { |command, array| "#{command} - #{array[0]}" }
  end

  def handle_command(command)
    command_class = find_command_class(command)
    return puts("\nERROR: Invalid Command - enter valid command\n\n") unless command_class

    command_class.new(projects).run
  end

  def find_command_class(user_input)
    command = user_input[0]
    COMMANDS[command][1]
  end
end
