# projects
# select project
# start timer
# stop timer
# record time to project
# update timer


# c = create, l = list, d = delete, s = select
# b = begin timer, e = end timer
require 'yaml/store'

Project = Struct.new(:name) do
  def to_s
    name
  end
end

store = YAML::Store.new "projects.yaml"
projects = nil
store.transaction do
  projects = store["Projects"] || []
end

while true
  puts "What is the command?\nc = create, l = list, d = delete\n s = select b = begin timer e = end timer"
  command = gets.chomp
  case command
  when /^c/
    puts "What is the project name?"
    project_name = gets.chomp
    projects << Project.new(project_name)
  when /^l/
    puts projects
  when /^d/
    puts "Which project would you like to delete?"
    command = gets.chomp
    projects.delete_if { |project| project.name == command }
  end
  store.transaction do
    store["Projects"] = projects
  end
end