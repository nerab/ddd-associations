module Dilatory
  class Project
    include DDD::Associations

    attr_accessor :title
    has_many :tasks

    def initialize(title)
      @title = title
    end
  end
end
