module Commands
  class CreateProject < Struct.new(:projects)
    def run
      puts "What is the project name?"
      project_name = gets.chomp
      projects << Project.new(project_name, 0)
    end
  end
end
