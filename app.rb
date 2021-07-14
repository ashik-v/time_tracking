require 'sinatra'
require 'time_tracking'

get('/projects')do
  @project = Project.new
  @project.name = "Ashik"
  erb :index
end