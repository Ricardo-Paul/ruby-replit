# require_relative "../schema"

module Reepay
  class Schema
    module SchemaFactory

      def schema 
        @schema || (@schema = ::Reepay::Schema.new)
      end

      def define_attribute(name, type)
        define_method(name) do
          puts "self here #{self.attributes}"
          attribute = ::Reepay::Schema.new.add_attribute(name, type)
          self.attributes[name]
        end

        define_method("#{name}=") do |val|
          self.attributes[name] = val
        end
      end
      
    end
  end
end
