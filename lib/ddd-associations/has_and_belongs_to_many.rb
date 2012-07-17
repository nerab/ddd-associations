module DDD
  module Associations
    module HasAndBelongsToMany
      module ClassMethods
        # Many tasks, many tags
        def has_and_belongs_to_many(others)
          @others = others
          self.send('attr_reader', others)
        end

        def new(super_class = Object, *args)
          super(super_class).tap do |instance|
            instance.instance_variable_set("@#{@others}", ManyToManyCollection.new(instance))
          end
        end
      end

      def self.included(base)
        base.extend(ClassMethods)
      end
    end
  end
end
