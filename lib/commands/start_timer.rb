module Commands
  class StartTimer < Struct.new(:projects)
    def self.description
      "begin timer"
    end

    def self.key
      "b"
    end

    def run
      print "Which project would you like to start a timer for? "
      project_name = get_string.chomp
      project = projects.find { |p| p.name == project_name }
      project.last_started_at = Time.now
    end
  end
end
