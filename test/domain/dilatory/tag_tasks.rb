module Dilatory
  #
  # Maintains the tasks of a tag
  #
  class TagTasks
    extend Forwardable
    def_delegators :@tasks, :size, :first

    #
    # Creates a new task set of a tag.
    #
    # +tag+ is the tag we are managing tasks for
    #
    def initialize(tag)
      @tasks = Set.new
      @tag = tag
    end

    #
    # Adds +task+ to this set of tasks
    #
    def <<(task)
      unless @tasks.include?(task)
        @tasks << task
        task.tags << @tag
      end
    end

    #
    # Remove +task+ from this set of tags
    #
    def delete(task)
      if @tasks.include?(task)
        @tasks.delete(task)
        task.tags.delete(@tag)
      end
    end
  end
end
