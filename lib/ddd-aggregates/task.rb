module DDD
  module Aggregates
    #
    # belongs_to :project
    #
    class Task
      attr_reader :title, :project

      def initialize(title, project = nil)
        @title = title
        self.project=(project)
      end

      def project=(project)
        if project.nil?
          @project.tasks.delete(self) if @project # de-register self at project it currently belongs to
#        else
#          project.tasks << self # register self at the new project
        end

        @project = project
      end
    end
  end
end
