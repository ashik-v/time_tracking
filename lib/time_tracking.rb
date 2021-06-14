require "active_support"

ActiveSupport::Dependencies.autoload_paths = ["lib/"]

COMMANDS = %w[c scrap b scrap e scrap s scrap 65 d scrap]

def gets
  command = COMMANDS.shift || exit
  puts command
  command
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
    print "c = create, d = delete s = set duration b = begin timer e = end timer\nWhat is the command? "
  end

  def command_from_user
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
