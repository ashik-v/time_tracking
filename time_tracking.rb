# projects
# select project
# start timer
# stop timer
# record time to project
# update timer


# c = create, l = list, d = delete, s = select
# b = begin timer, e = end timer
projects = []

while true
  puts "What is the command?\nc = create, l = list, d = delete\n s = select b = begin timer e = end timer"
  command = gets.chomp
  case command
  when /^c/
    puts "What is the project name?"
    project_name = gets.chomp
    projects << project_name
  when /^l/
    puts projects
  end
end



