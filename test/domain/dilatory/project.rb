module Dilatory
  class Project
    include DDD::Associations::HasMany

    attr_accessor :title
    has_many :tasks

    def initialize(title)
      @title = title
      @tasks = ProjectTasks.new(self)
    end
  end
end
