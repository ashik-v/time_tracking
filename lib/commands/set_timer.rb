module Commands
  class SetTimer < Struct.new(:projects)
    def self.description
      "set timer"
    end

    def self.key
      "s"
    end

    def run
      print "What project would you like to edit minutes for? "
      puts project_name = get_string.chomp
      project = projects.find { |p| p.name == project_name }
      print "What are the updated minutes? "
      project.minutes = get_string.chomp.to_i
      project.last_started_at = nil
    end
  end
end
