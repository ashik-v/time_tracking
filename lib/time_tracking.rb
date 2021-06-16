require "active_support"

ActiveSupport::Dependencies.autoload_paths = ["lib/"]

COMMANDS = %w[c scrap b scrap e scrap s scrap 65 d scrap]

def test_mode?
  ENV["TEST_MODE"]
end

def get_string
  if test_mode?
    command = COMMANDS.shift || exit
    puts command
    command
  else
    gets
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
    print " #{command_header}"
    print "\nWhat is the command? "
  end

  def command_header
    HandleCommand.command_header
  end

  def command_from_user
    get_string.chomp
  end

  def save_projects
    project_repo.save
  end

  def projects
    project_repo.projects
  end

  def project_repo
    @project_repo ||= ProjectRepo.new(repo_filename)
  end

  def repo_filename
    test_mode? ? "data/test_projects.yaml" : "data/projects.yaml"
  end
end

TimeTracking.new.main
