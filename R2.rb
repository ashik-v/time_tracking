require 'yaml/store'

Project = Struct.new(:name) do
  def to_s
    name
  end
end

store = YAML::Store.new "scrap_projects_2.yaml"

projects = []
store.transaction do
  projects = store["Projects"] || []
end

while true
  puts "Enter command"
  command = gets.chomp

  case command
  when /^l/
  puts projects
  when /^c/
  puts "Enter project name"
  project_name = gets.chomp
  projects << Project.new(project_name)
  when /^d/
  puts "Enter project name"
  project_name = gets.chomp
  projects.delete_if { |project| project.name == project_name } 
  end

  store.transaction do
    store["Projects"] = projects
  end
end