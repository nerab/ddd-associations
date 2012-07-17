module DDD
  module Associations
    class ManyToManyCollection
      extend Forwardable
      def_delegators :@many, :size, :first, :each

      #
      # +one+ is what we are the collection for
      #
      def initialize(one)
        @many = Set.new
        @name = one.class.name.demodulize.downcase.pluralize
        @one = one
      end

      def <<(one)
        unless @many.include?(one)
          @many << one
          one.send("#{@name}") << @one
        end
      end

      def delete(one)
        if @many.include?(one)
          @many.delete(one)
          one.send("#{@name}").delete(@one)
        end
      end
    end
  end
end
