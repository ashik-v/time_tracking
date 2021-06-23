module Commands
  class EndTimer < Command
    def self.description
      "end timer"
    end

    def run
      print "What project would you like to end timer for? "
      project_name = get_string.chomp
      project = projects.find { |p| p.name == project_name }
      project.minutes += ((Time.now - project.last_started_at) / 60).to_i
      project.last_started_at = nil
    end
  end
end
