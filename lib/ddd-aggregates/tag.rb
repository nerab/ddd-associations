module DDD
  module Aggregates
    #
    # has_and_belongs_to_many :tasks
    #
    class Tag
      attr_accessor :name
      attr_reader :tasks

      def initialize(name)
        @name = name
        @tasks = TagTaskList.new(self)
      end
    end
  end
end
