module Commands
  class EditTimer < Struct.new(:projects)
    def run
      puts "What project would you like to edit minutes for?"
      puts project_name = gets.chomp
      project = projects.find { |p| p.name == project_name }
      puts "What are the updated minutes?"
      project.minutes = gets.chomp.to_i
      project.last_started_at = nil
    end
  end
end
