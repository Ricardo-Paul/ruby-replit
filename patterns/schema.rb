# require_relative './schema_factory'
# makes Reepay::Schema::SchemaFactory available in this file
# does not matter where we require it

# the magic lives here

module Reepay
  class Schema
    attr_reader :attributes
    def initialize
      @attributes = {}
    end

    def add_attribute(name, type)
      attribute = PrimitiveAttribute.build(type)
    end

    class Attribute
      def initialize(type)
        @type = type
      end
  
      def self.build(type)
        PrimitiveAttribute.new(type)
      end
    end

    class PrimitiveAttribute < Attribute
    end
  end
  
  require_relative './schema/schema_factory'
end
