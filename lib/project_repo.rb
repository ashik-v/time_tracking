require "yaml/store"
require_relative "project"

class ProjectRepo
  attr_reader :store, :projects

  def initialize(filename)
    @store = YAML::Store.new(filename)
    @projects = load_projects
  end

  def save
    store.transaction do
      store["Projects"] = projects
    end
  end

  private

  def load_projects
    projects = nil
    store.transaction do
      projects = store["Projects"] || []
    end
    projects
  end
end
