module Dilatory
  class ProjectTasks
    extend Forwardable
    def_delegators :@tasks, :size, :first

    #
    # +project+ is the project we are managing tasks for
    #
    def initialize(project)
      @tasks = Set.new
      @project = project
    end

    def <<(task)
      unless @tasks.include?(task)
        @tasks << task
        task.project = @project
      end
    end

    def delete(task)
      if @tasks.include?(task)
        @tasks.delete(task)
        task.project = nil
      end
    end
  end
end
