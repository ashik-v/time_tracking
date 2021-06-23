module Commands
  class Command < Struct.new(:projects)
    def self.key
      description.chars.first
    end

    def self.description
      name.split("::").last.titleize.downcase
    end
  end
end
