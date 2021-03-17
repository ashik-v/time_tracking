projects = []

while true
  puts "Enter Command: \n c: create d: delete l: list"
  command = gets.chomp

  case command
  when /^c/
    puts "Enter project name"
    project_name = gets.chomp
    projects << project_name
  when /^d/
    puts "Enter project name"
    project_name = gets.chomp
    projects.delete(project_name)
  when /^l/
    puts projects
  end
end