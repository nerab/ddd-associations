module DDD
  module Associations
    module BelongsTo
      module ClassMethods
        def belongs_to(attrib_name)
          self.send('attr_reader', attrib_name)
          self.send('define_method', "#{attrib_name}=") do |one|
            return if self.instance_variable_get("@#{attrib_name}") == one

            collection_name = self.class.name.demodulize.downcase.pluralize

            if one.nil?
              # de-register self at one it currently belongs to
              self.instance_variable_get("@#{attrib_name}").send(collection_name).delete(self) if self.instance_variable_get("@#{attrib_name}")
            else
              # register self at the one
              one.send(collection_name) << self
            end

            self.instance_variable_set("@#{attrib_name}", one)
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
