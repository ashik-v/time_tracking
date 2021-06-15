module Commands
  class CreateProject < Struct.new(:projects)
    def run
      print "What is the project name? "
      project_name = get_string.chomp
      projects << Project.new(project_name, 0)
    end
  end
end
