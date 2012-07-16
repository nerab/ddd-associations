module DDD
  module Associations
    #
    # Maintains the tasks of a tag
    #
    class TagTaskList
      extend Forwardable
      def_delegators :@tasks, :size, :first, :last

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

      #
      # Remove +task+ from this list of tags
      #
      def delete(task)
        result = nil

        if @tasks.include?(task)
          result = @tasks.delete(task)
          task.tags.delete(@tag)
        end

        result
      end
    end
  end
end
