require "yaml/store"
require_relative "project"

class ProjectRepo
  attr_reader :filename

  def initialize(filename)
    @filename = filename
  end

  def load_projects
    store = YAML::Store.new(filename)
    projects = nil
    store.transaction do
      projects = store["Projects"] || []
    end
    projects
  end

  def save_projects(projects)
    store = YAML::Store.new(filename)
    store.transaction do
      store["Projects"] = projects
    end
  end
end
