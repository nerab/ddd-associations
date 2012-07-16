module DDD
  module Associations
    #
    # Maintains the tags of a task
    #
    class TaskTagList
      extend Forwardable
      def_delegators :@tags, :size, :first, :last

      #
      # +task+ is the task we are managing tags for
      #
      def initialize(task)
        @tags = []
        @task = task
      end

      def <<(tag)
        unless @tags.include?(tag)
          @tags << tag
          tag.tasks << @task
        end
      end

      #
      # Remove +tag+ from this list of tasks
      #
      def delete(tag)
        result = nil

        if @tags.include?(tag)
          result = @tags.delete(tag)
          tag.tasks.delete(@task)
        end

        result
      end
    end
  end
end
