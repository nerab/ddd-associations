module DDD
  module Associations
    module BelongsTo
      module ClassMethods
        def belongs_to(other)
          self.send('attr_reader', other)
          self.send('define_method', "#{other}=") do |one|
            return if self.instance_variable_get("@#{other}") == one

            collection_name = self.class.name.demodulize.downcase.pluralize

            if one.nil?
              # de-register self at one it currently belongs to
              self.instance_variable_get("@#{other}").send(collection_name).delete(self) if self.instance_variable_get("@#{other}")
            else
              # register self at the one
              one.send(collection_name) << self
            end

            self.instance_variable_set("@#{other}", one)
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
