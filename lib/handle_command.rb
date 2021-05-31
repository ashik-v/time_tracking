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

  class CreateProject < Struct.new(:projects)
    def run
      puts "What is the project name?"
      project_name = gets.chomp
      projects << Project.new(project_name, 0)
    end
  end

  class DeleteProject < Struct.new(:projects)
    def run
      puts "Which project would you like to delete?"
      project_name = gets.chomp
      projects.delete_if { |p| p.name == project_name }
    end
  end

  class StartTimer < Struct.new(:projects)
    def run
      puts "Which project would you like to start a timer for?"
      project_name = gets.chomp
      project = projects.find { |p| p.name == project_name }
      project.last_started_at = Time.now
    end
  end

  class EndTimer < Struct.new(:projects)
    def run
      puts "What project would you like to end timer for?"
      project_name = gets.chomp
      project = projects.find { |p| p.name == project_name }
      project.minutes += ((Time.now - project.last_started_at) / 60).to_i
      project.last_started_at = nil
    end
  end

  class EditTimer < Struct.new(:projects)
    def run
      puts "What project would you like to edit minutes for?"
      project_name = gets.chomp
      project = projects.find { |p| p.name == project_name }
      puts "What are the updated minutes?"
      project.minutes = gets.chomp.to_i
      project.last_started_at = nil
    end
  end
end
