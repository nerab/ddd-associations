module DDD
  module Associations
    module HasMany
      module ClassMethods
        def has_many(others)
          @others = others
          self.send('attr_reader', others)
        end

        def new(super_class = Object, *args)
          super(super_class).tap do |instance|
            instance.instance_variable_set("@#{@others}", OneToManyCollection.new(instance))
          end
        end
      end

      # http://blog.jayfields.com/2006/12/ruby-instance-and-class-methods-from.html
      def self.included(base)
        base.extend(ClassMethods)
      end
    end
  end
end
