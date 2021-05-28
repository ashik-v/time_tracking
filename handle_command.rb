class HandleCommand
  attr_reader :projects

  def initialize(projects)
    @projects = projects
  end

  def handle_command(command)
    case command
    when /^c/
      create_project
    when /^d/
      delete_project
    when /^b/
      start_timer
    when /^e/
      end_timer
    when /^s/
      edit_timer
    end
  end

  def create_project
    puts "What is the project name?"
    project_name = gets.chomp
    projects << Project.new(project_name, 0)
  end

  def delete_project
    puts "Which project would you like to delete?"
    project_name = gets.chomp
    projects.delete_if { |project| project.name == project_name }
  end

  def start_timer
    puts "Which project would you like to start a timer for?"
    project_name = gets.chomp
    project = projects.find { |project| project.name == project_name }
    project.last_started_at = Time.now
  end

  def end_timer
    puts "What project would you like to end timer for?"
    project_name = gets.chomp
    project = projects.find { |project| project.name == project_name }
    project.minutes += ((Time.now - project.last_started_at) / 60).to_i
    project.last_started_at = nil
  end

  def edit_timer
    puts "What project would you like to edit minutes for?"
    project_name = gets.chomp
    project = projects.find { |project| project.name == project_name }
    puts "What are the updated minutes?"
    project.minutes = gets.chomp.to_i
    project.last_started_at = nil
  end
end
