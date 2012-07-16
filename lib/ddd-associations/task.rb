module DDD
  module Associations
    #
    # belongs_to :project
    # has_and_belongs_to_many :tags
    #
    class Task
      attr_reader :title, :project, :tags

      def initialize(title, project = nil)
        @title = title
        self.project=(project)
        @tags = TaskTags.new(self)
      end

      def project=(project)
        return if @project == project

        if project.nil?
          @project.tasks.delete(self) if @project # de-register self at project it currently belongs to
        else
          project.tasks << self # register self at the new project
        end

        @project = project
      end

      def hash
        title.hash + project.hash + tags.hash
      end

      def ==(other)
        return false unless other.is_a?(Task)
        title == other.title && tags == other.tags && project == other.project
      end
    end
  end
end
