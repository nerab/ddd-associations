module DDD
  module Associations
    module ClassMethods
      #
      # One project has many tasks
      #
      def has_many(others)
        @others = others
        @collection = OneToManyCollection
        self.send('attr_reader', others)
      end

      #
      # A task belongs to a project
      #
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

      #
      # Regular attribute definition:
      #
      #   has_one :title
      #
      # is almost equivalent to
      #
      #   attr_accessor
      #
      # In addition, it registers the attribute(s) to they can be enumerated in the repository etc.
      #
      def has_one(*attr)
        if attr.nil? or attr.empty?
          @attributes
        else
          @attributes = attr
          @attributes.each{|attr| self.send('attr_accessor', attr)}
        end
      end

      attr_reader :attributes

      #
      # Many tasks belong to many tags and vice versa
      #
      def has_and_belongs_to_many(others)
        @others = others
        @collection = ManyToManyCollection
        self.send('attr_reader', others)
      end

      def new(*args)
        super(*args).tap do |instance|
          instance.instance_variable_set("@#{@others}", @collection.new(instance))
        end
      end
    end

    # http://blog.jayfields.com/2006/12/ruby-instance-and-class-methods-from.html
    def self.included(base)
      base.extend(ClassMethods)
    end
  end
end
