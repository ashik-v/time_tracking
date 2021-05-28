require_relative "project_repo"
require_relative "project"
require_relative "handle_command"

class TimeTracking
  def main
    loop do
      display_projects
      display_prompt
      HandleCommand.new(projects).handle_command(get_command)
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

  def save_projects
    ProjectRepo.save_projects(projects)
  end

  def projects
    @projects ||= ProjectRepo.load_projects
  end
end

TimeTracking.new.main
