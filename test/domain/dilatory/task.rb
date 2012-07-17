module Dilatory
  #
  # has_and_belongs_to_many :tags
  #
  class Task
    include DDD::Associations::BelongsTo
    include DDD::Associations::HasAndBelongsToMany

    attr_reader :title
    belongs_to :project
    has_and_belongs_to_many :tags

    def initialize(title, project = nil)
      @title = title
      self.project = project
    end
  end
end
