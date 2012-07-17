module DDD
  module Associations
    module Helpers
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
