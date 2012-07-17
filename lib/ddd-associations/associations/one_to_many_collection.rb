module DDD
  module Associations
    class OneToManyCollection
      extend Forwardable
      def_delegators :@many, :size, :first

      #
      # +one+ is the one we are managing many for
      #
      def initialize(one)
        @many = Set.new
        @name = one.class.name.demodulize.downcase
        @one = one
      end

      def <<(one)
        unless @many.include?(one)
          @many << one
          one.send("#{@name}=", @one)
        end
      end

      def delete(one)
        if @many.include?(one)
          @many.delete(one)
          one.send("#{@name}=", nil)
        end
      end
    end
  end
end
