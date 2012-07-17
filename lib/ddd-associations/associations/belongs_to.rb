module DDD
  module Associations
    module BelongsTo
      module ClassMethods
        def belongs_to(attrib_name)
          self.send('attr_reader', attrib_name)
          self.send('define_method', "#{attrib_name}=") do |one|
            return if self.instance_variable_get("@#{attrib_name}") == one

            if one.nil?
              # de-register self at one it currently belongs to
              self.instance_variable_get("@#{attrib_name}").tasks.delete(self) if self.instance_variable_get("@#{attrib_name}")
            else
              # register self at the one
              one.tasks << self
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
