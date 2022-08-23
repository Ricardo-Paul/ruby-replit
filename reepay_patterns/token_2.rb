module Tokens
  class Token
    class Error < StandardError
      # this field can be assigned when the Error is rescued
      attr_accessor :field
    end

    class << self
      def find
        MyCashToken.new
      end
    end
    
  end
end

module Tokens
  class MyCashToken < Token
    def apply_to_billing_details(billing_details)
      billing_details.attributes = {
        type: 'MyCashToken'
      }
    end
  end
end

module Payments
  class BillingDetailsTokenApplicationService
    def self.call(billing_details, token_id)

      # this is a token object
      token = Tokens::Token.find

      puts "Token found #{token}"
      # here it looks like we are applying the billing details on the token
      # however what actually happens is we set the token fields on the biling details
      token.apply_to_billing_details billing_details

      # update billing details to indicate token has been applied
      billing_details.token_id = nil
      billing_details.token_applied = true

      # raise Tokens::Token::Error
      billing_details
      # rescue specific token error
    rescue Tokens::Token::Error => e
      e.field = "Failed to apply token to billing details"
      raise
    end
  end
end

# may refactor after but billing_details is an object
class BillingDetails
  def self.build
    new
  end
  attr_reader :payment_method
  attr_accessor :token_id, :token_applied, :attributes
  def initialize
    @payment_method = 'ApplePay'
  end
end

# puts "#{billing_details.payment_method}"
bd = Payments::BillingDetailsTokenApplicationService.call(BillingDetails.build, 'a_tk_id')

puts "#{bd.inspect}"
