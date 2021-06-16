module Commands
  class CreateProject < Struct.new(:projects)
    def self.description
      "create project"
    end

    def run
      print "What is the project name? "
      project_name = get_string.chomp
      projects << Project.new(project_name, 0)
    end
  end
end
