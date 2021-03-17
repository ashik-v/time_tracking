require 'yaml/store'

Project = Struct.new(:name) do
  def to_s
    name
  end
end

store = YAML::Store.new "scrap_projects.yaml"
projects = []
store.transaction do
  projects = store["Projects"] || []
end

while true
  puts "Enter Command: \n c: create d: delete l: list"
  command = gets.chomp

  case command
  when /^c/
    puts "Enter project name"
    project_name = gets.chomp
    projects << Project.new(project_name)
  when /^d/
    puts "Enter project name"
    project_name = gets.chomp
    projects.delete_if {|project| project.name == project_name}
  when /^l/
    puts projects
  end
  store.transaction do
    store["Projects"] = projects
  end
end