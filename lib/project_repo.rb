require "yaml/store"

module ProjectRepo
  def self.load_projects
    store = YAML::Store.new "data/projects.yaml"
    projects = nil
    store.transaction do
      projects = store["Projects"] || []
    end
    projects
  end

  def self.save_projects(projects)
    store = YAML::Store.new "data/projects.yaml"
    store.transaction do
      store["Projects"] = projects
    end
  end
end
