puts "Build gateways"

# PaymentGateway is an ApplicationRecord subclass - linked to ActiveRecord table
class PaymentGateway
  attr_reader :default_currencies
  def initialize(site, default_currencies, gateway_type)
    @site = site,
    @default_currencies = default_currencies
    @gateway_type = gateway_type
  end
end

# STI
class CheckCommercePaymentGateway < PaymentGateway
end

class AmazonPaymentGateway < PaymentGateway
end

module PaymentGateways
  class Factory
    def self.build(site, gateway_type, partner_config_beta)
      new(site, gateway_type, partner_config_beta).build
    end

    attr_reader :gateway_type, :site
    
    def initialize(site, gateway_type, partner_config_beta)
      @site = site,
      @gateway_type = gateway_type,
      @partner_config_beta = partner_config_beta
    end

    # build will eventually create a new gateway instance based on the gateway_type argument
    def build
      mapped_gateway || credit_card_gateway || partner_gateway
    end

    PAYMENT_GATEWAY_MAPPINGS = {
      # gateway_type: GatewayClass
      check_commerce: CheckCommercePaymentGateway,
      amazon: AmazonPaymentGateway
    }

    def gateway_class
      @gateway_class ||= PAYMENT_GATEWAY_MAPPINGS[gateway_type.to_sym]
    end

    def default_currencies
      ["USD", "EUR"]
    end

    def gateway_for_class(gateway_class)
      gateway_class.new(site, default_currencies, gateway_type)
    end 
    
    def mapped_gateway
      puts "logging gateway class: #{gateway_class}"
      gateway_class and gateway_for_class(gateway_class)
    end

    def credit_card_gateway
    end 

    def partner_gateway
    end
  end
end

gateway = PaymentGateways::Factory.build('twitch', 'check_commerce', false)

puts "created gateway instance: #{gateway}"
puts "default currencies for cretated instance: #{gateway.default_currencies}"