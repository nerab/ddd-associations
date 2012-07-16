module DDD
  module Aggregates
    class ProjectTaskList
      extend Forwardable
      def_delegators :@tasks, :size, :first, :last, :delete

      #
      # +project+ is the project we are managing tasks for
      #
      def initialize(project)
        @tasks = []
        @project = project
      end

      def <<(task)
        unless @tasks.include?(task)
          @tasks << task
          task.project = @project
        end
      end
    end
  end
end
