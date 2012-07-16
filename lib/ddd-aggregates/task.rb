module DDD
  module Aggregates
    #
    # belongs_to :project
    #
    class Task
      attr_accessor :title, :project

      def initialize(title, project = nil)
        @title, @project = title, project
      end
    end
  end
end
