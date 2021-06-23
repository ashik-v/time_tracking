module Commands
  class DeleteProject < Command
    def self.description
      "delete project"
    end

    def run
      print "Which project would you like to delete? "
      project_name = get_string.chomp
      projects.delete_if { |p| p.name == project_name }
    end
  end
end
