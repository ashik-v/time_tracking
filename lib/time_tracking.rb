require "active_support"

ActiveSupport::Dependencies.autoload_paths = ["lib/"]

def get_string
  if TestMode.test_mode?
    command = TestMode.get_command
    puts command
    command
  else
    gets
  end
end

class TimeTracking
  def main
    loop do
      project_repo.persist do |projects|
        display_projects(projects)
        display_prompt
        HandleCommand.new(projects).handle_command(command_from_user)
      end
    end
  end

  def display_projects(projects)
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
    get_string.chomp
  end

  def project_repo
    @project_repo ||= ProjectRepo.new(filename)
  end

  def filename
    TestMode.test_mode? ? "data/test_projects.yaml" : "data/projects.yaml"
  end
end

TimeTracking.new.main
