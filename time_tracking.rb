# projects
# select project
# start timer
# stop timer
# record time to project
# update timer


# c = create, l = list, d = delete, s = select
# b = begin timer, e = end timer
require 'yaml/store'

Project = Struct.new(:name, :minutes, :start_time) do
  def to_s
    format("%s %s %s", name, minutes, start_time)
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
    projects << Project.new(project_name, 0)
  when /^l/
    puts projects
  when /^d/
    puts "Which project would you like to delete?"
    project_name = gets.chomp
    projects.delete_if { |project| project.name == project_name }
  when /^b/
    puts "Which project would you like to start a timer for?"
    project_name = gets.chomp
    project = projects.find { |project| project.name == project_name }
    project.start_time = Time.now
  end
  store.transaction do
    store["Projects"] = projects
  end
end