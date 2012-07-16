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
        @name = demodulize(one.class.name).downcase
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

      private

      # We don't want to pull in all ActiveSupport just for this ...
      # http://api.rubyonrails.org/classes/ActiveSupport/Inflector.html#method-i-demodulize
      def demodulize(path)
        path = path.to_s
        if i = path.rindex('::')
          path[(i+2)..-1]
        else
          path
        end
      end
    end
  end
end
