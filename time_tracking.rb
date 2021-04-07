# cloumn headers
# extract methods
# format time HH:MM

# c = create, l = list, d = delete, s = select
# b = begin timer, e = end timer
require_relative "project_repo"

Project = Struct.new(:name, :minutes, :last_started_at) do
  def display_time
    format("%02d:%02d",display_hours, display_minutes)
  end

  def display_hours
    minutes.to_i/60
  end

  def display_minutes
    minutes.to_i%60
  end
end

class TimeTracking
  def main
    while true
      display_projects
      display_prompt
      handle_command(get_command)
      save_projects
    end   
  end

  def display_projects
    display_header
    projects.each do |project|
      display_project(project)
    end
  end

  def display_header
    puts format("|%-15s | %-5s | %-26s|", "Project Name", "Timer", "Last Started At")
  end

  def display_project(project)
    puts format("|%-15s | %-5s | %-26s|", project.name, project.display_time || "-", project.last_started_at || "-")
  end

  def display_prompt
    puts "What is the command?\nc = create, d = delete\n s = set duration b = begin timer e = end timer"
  end

  def get_command
    gets.chomp
  end

  def handle_command (command)
    case command
    when /^c/
      puts "What is the project name?"
      project_name = gets.chomp
      projects << Project.new(project_name, 0)
    when /^d/
      puts "Which project would you like to delete?"
      project_name = gets.chomp
      projects.delete_if { |project| project.name == project_name }
    when /^b/
      puts "Which project would you like to start a timer for?"
      project_name = gets.chomp
      project = projects.find { |project| project.name == project_name }
      project.last_started_at = Time.now
    when /^e/
      puts "What project would you like to end timer for?"
      project_name = gets.chomp
      project = projects.find { |project| project.name == project_name }
      project.minutes += ((Time.now - project.last_started_at)/60).to_i
      project.last_started_at = nil
    when /^s/
      puts "What project would you like to edit minutes for?"
      project_name = gets.chomp
      project = projects.find { |project| project.name == project_name }
      puts "What are the updated minutes?"
      project.minutes = gets.chomp.to_i
      project.last_started_at = nil
    end
  end

  def save_projects
    ProjectRepo.save_projects(projects)
  end

  def projects
    @projects ||= ProjectRepo.load_projects
  end
end

TimeTracking.new.main