module DDD
  module Aggregates
    class TaskList
      extend Forwardable
      def_delegators :@tasks, :size, :first, :last

      #
      # +project+ is the project we are managing tasks for
      #
      def initialize(project)
        @tasks = []
        @project = project
      end

      def <<(task)
        @tasks << task
        task.project = @project
      end
    end
  end
end
