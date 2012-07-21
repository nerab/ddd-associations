module Dilatory
  class Project
    include DDD::Associations

    attr_accessor :title, :goal
    has_many :tasks

    def initialize(title, goal = nil)
      @title, @goal = title, goal
    end
  end
end
