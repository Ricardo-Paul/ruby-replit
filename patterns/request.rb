# imports
require_relative './schema'

module Reepay
  class Request
    extend Schema::SchemaFactory
    attr_reader :attributes
    
    def initialize(attributes = {})
      @attributes = {"init": "attr_init"}
      puts "initializer #{attributes}"
      self.class.define_attribute(attributes, String)
    end
  end
end
