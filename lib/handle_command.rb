class HandleCommand < Struct.new(:projects)
  COMMANDS = [
    Commands::CreateProject,
    Commands::DeleteProject,
    Commands::BeginTimer,
    Commands::EndTimer,
    Commands::EditTimer,
  ]

  def self.command_header
    COMMANDS.map { |command| "#{command.key} - #{command.description}" }
  end

  def handle_command(user_input)
    command = find_command(user_input)
    return puts("\nERROR: Invalid Command - enter valid command\n\n") unless command

    command.new(projects).run
  end

  def find_command(user_input)
    key = user_input[0]
    COMMANDS.select { |command| key == command.key }.first
  end
end
