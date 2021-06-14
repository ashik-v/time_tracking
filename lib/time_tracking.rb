require "active_support"

ActiveSupport::Dependencies.autoload_paths = ["lib/"]

COMMANDS = %w[t c scrap b scrap e scrap s scrap 65 d scrap]

TEST_MODE = ENV["TEST_MODE"]

if TEST_MODE
  def gets
    COMMANDS.shift || exit
  end
end

class TimeTracking
  def main
    loop do
      display_projects
      display_prompt
      HandleCommand.new(projects).handle_command(command_from_user)
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

  def command_from_user
    gets.chomp
  end

  def save_projects
    ProjectRepo.save_projects(projects, "data/projects.yaml")
  end

  def projects
    @projects ||= ProjectRepo.load_projects("data/projects.yaml")
  end
end

TimeTracking.new.main
