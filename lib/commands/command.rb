module Commands
  class Command < Struct.new(:projects)
    def self.key
      description.chars.first
    end
  end
end
