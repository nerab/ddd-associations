module Dilatory
  class Project
    include DDD::Associations::HasMany

    attr_accessor :title
    has_many :tasks

    def initialize(title)
      @title = title
    end
  end
end
