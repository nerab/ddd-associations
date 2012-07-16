module DDD
  module Associations
    module HasMany
      module ClassMethods
        def has_many(name)
          self.send('attr_reader', name)
#          instance_variable_set("@#{name}".to_sym, ProjectTasks.new(self))
        end
      end

      # http://blog.jayfields.com/2006/12/ruby-instance-and-class-methods-from.html
      def self.included(base)
        base.extend(ClassMethods)
      end
    end
  end
end
