class StartTimer < Struct.new(:projects)
  def run
    puts "Which project would you like to start a timer for?"
    project_name = gets.chomp
    project = projects.find { |p| p.name == project_name }
    project.last_started_at = Time.now
  end
end
