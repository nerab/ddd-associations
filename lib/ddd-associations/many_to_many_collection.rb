module DDD
  module Associations
    class ManyToManyCollection < ManyCollection
      def <<(another_one)
        unless many.include?(another_one)
          many << another_one
          another_one.send("#{collection_name}") << one
        end
      end

      def delete(another_one)
        if many.include?(another_one)
          many.delete(another_one)
          another_one.send("#{collection_name}").delete(one)
        end
      end

      protected

      def collection_name
        one.class.name.demodulize.downcase.pluralize
      end
    end
  end
end
