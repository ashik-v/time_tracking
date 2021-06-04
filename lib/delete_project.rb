class DeleteProject < Struct.new(:projects)
  def run
    puts "Which project would you like to delete?"
    project_name = gets.chomp
    projects.delete_if { |p| p.name == project_name }
  end
end
