module DDD
  module Associations
    class OneToManyCollection < ManyCollection
      def <<(another_one)
        unless many.include?(another_one)
          many << another_one
          another_one.send("#{collection_name}=", one)
        end
      end

      def delete(another_one)
        if many.include?(another_one)
          many.delete(another_one)
          another_one.send("#{collection_name}=", nil)
        end
      end

      protected

      def collection_name
        one.class.name.demodulize.downcase.singularize
      end
    end
  end
end
