module DDD
  module Aggregates
    #
    # has_many :tasks
    #
    class Project
      attr_accessor :title, :tasks

      def initialize(title, tasks = [])
        @title, @tasks = title, tasks
      end
    end
  end
end
