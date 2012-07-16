module DDD
  module Associations
    class TaskTagList
      extend Forwardable
      def_delegators :@tags, :size, :first, :last, :delete

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
    end
  end
end
