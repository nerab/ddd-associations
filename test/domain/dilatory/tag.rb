module Dilatory
  class Tag
    include DDD::Associations::HasMany
    include DDD::Associations::HasAndBelongsToMany

    attr_accessor :name
    has_many :tasks
    has_and_belongs_to_many :tasks

    def initialize(name)
      @name = name
    end
  end
end
