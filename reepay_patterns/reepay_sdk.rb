module Reepay
  module Requests
    # class for creating the account
    # to be passed all the way down to post
    class AccountCreate
    end
  end
end

module Reepay
  class Client
    # operations are defined here
    def create_account
      post
    end
  end
end

module Reepay
  class Client
    def initialize
      puts 'inited!'
      yield(self) if block_given?
    end

    # http methods
    def post
      puts 'post was called'
    end
  end
end

Reepay::Client.new do |client|
  client.create_account
end
