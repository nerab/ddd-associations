module DDD
  module Associations
    #
    # Maintains the tags of a task
    #
    class TaskTags
      extend Forwardable
      def_delegators :@tags, :size, :first

      #
      # +task+ is the task we are managing tags for
      #
      def initialize(task)
        @tags = Set.new
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
        if @tags.include?(tag)
          @tags.delete(tag)
          tag.tasks.delete(@task)
        end
      end
    end
  end
end
