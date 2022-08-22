require_relative '../request'

class AccountCreate < Reepay::Request
  # why do we even need the define_attribute method here
  define_attribute 'company', String
end

# now we are able to initialize
account = AccountCreate.new('Google')
account.company = "Apple Co"
puts "the company: #{account.company}"
