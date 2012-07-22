module DDD
  module Associations
    #
    # Base class for has_many and has_and_belongs_to_many collections
    #
    class ManyCollection
      extend Forwardable
      include Enumerable
      def_delegators :@many, :size, :each

      #
      # +one+ is what we are the collection for
      #
      def initialize(one)
        @one = one
        @many = Set.new
      end

      protected

      attr_reader :many, :one
    end
  end
end
