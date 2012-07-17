module Dilatory
  #
  # has_and_belongs_to_many :tags
  #
  class Task
    include DDD::Associations::BelongsTo

    attr_reader :title, :tags
    belongs_to :project

    def initialize(title, project = nil)
      @title = title
      self.project = project
      @tags = TaskTags.new(self)
    end
  end
end
