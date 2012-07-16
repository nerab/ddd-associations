module DDD
  module Associations
    #
    # has_and_belongs_to_many :tasks
    #
    class Tag
      attr_accessor :name
      attr_reader :tasks

      def initialize(name)
        @name = name
        @tasks = TagTasks.new(self)
      end

      def hash
        name.hash + tasks.hash
      end

      def ==(other)
        return false unless other.is_a?(Tag)
        name == other.name && tasks == other.tasks
      end
    end
  end
end
