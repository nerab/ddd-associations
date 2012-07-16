module DDD
  module Associations
    #
    # has_many :tasks
    #
    class Project
      attr_accessor :title
      attr_reader :tasks

      def initialize(title)
        @title = title
        @tasks = ProjectTasks.new(self)
      end

      def hash
        title.hash + tasks.hash
      end

      def ==(other)
        return false unless other.is_a?(Project)
        title == other.title && tasks == other.tasks
      end
    end
  end
end
