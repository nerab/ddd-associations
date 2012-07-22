module Dilatory
  class Entity
    attr_accessor :uuid

    def initialize
      @uuid = %x[uuidgen].strip.downcase # http://www.ruby-forum.com/topic/164078#722181
    end

    def hash
      uuid.hash
    end

    # Entity objects have their identity defined by the uuid.
    # If the uuids are the same, the objects are identical.
    def ==(other)
      return false unless other.is_a?(Entity)
      uuid == other.uuid
    end

    # As opposed to identity, equality is defined as having all attributes identical
    #
    def eql?(other)
      self.class.attributes.each do |attr|
        return false unless send(attr).eql?(other.send(attr))
      end
    end
  end
end
