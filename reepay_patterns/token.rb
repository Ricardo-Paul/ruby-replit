module Tokens
  class Token
    class Error < StandardError; end
    class NotFoundError < StandardError; end

    def self.inherited(subclass)
      "the subclass #{subclass}"
    end

    attr_reader :data
    def initialize(opts)
      @data = opts.key?(:data) ? opts[:data] : build_data
    end
  
    def more_data
      {
        gateway: 'Braintree',
        currency: 'USD'
      }
    end

    def build_data
      raise NotImplementedError
    end
  end
end

# tok = Tokens::Token.new({ data: 'apple_pay_token' })
# puts tok.data.to_s

module Tokens
  class ApplePayToken < Token
    def attr
      attributes = {
        **data,
        **more_data
      }
    end
  end
end

# data = Tokens::ApplePayToken.new({ data: { token: '979573957b' } }).attr
# puts data.to_s
 
class Parent
  def self.inherited(subclass)
    subclass.define_method :hey_parent do
      puts "the child is #{subclass}"
    end
  end
end

class Child < Parent
end

# Child.new.hey_parent