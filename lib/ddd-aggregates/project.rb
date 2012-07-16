module DDD
  module Aggregates
    #
    # has_many :tasks
    #
    class Project
      attr_accessor :title
      attr_reader :tasks

      def initialize(title)
        @title = title
        @tasks = ProjectTaskList.new(self)
      end
    end
  end
end
