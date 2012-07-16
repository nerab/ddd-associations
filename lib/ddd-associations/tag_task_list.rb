module DDD
  module Associations
    class TagTaskList
      extend Forwardable
      def_delegators :@tasks, :size, :first, :last, :delete

      #
      # +tag+ is the tag we are managing tasks for
      #
      def initialize(tag)
        @tasks = []
        @tag = tag
      end

      def <<(task)
        unless @tasks.include?(task)
          @tasks << task
          task.tags << @tag
        end
      end
    end
  end
end
