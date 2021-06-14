require "yaml/store"
require_relative "project"

module ProjectRepo
  def self.load_projects(filename)
    store = YAML::Store.new filename
    projects = nil
    store.transaction do
      projects = store["Projects"] || []
    end
    projects
  end

  def self.save_projects(projects, _filename)
    store = YAML::Store.new "data/projects.yaml"
    store.transaction do
      store["Projects"] = projects
    end
  end
end
