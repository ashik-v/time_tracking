require 'sinatra'
require 'time_tracking'

get('/projects')do
  @projects = []
  @projects[0] = Project.new
  @projects[0].name = "Ashik"
  @projects[1] = Project.new
  @projects[1].name = "Chunky"
  erb :index
end