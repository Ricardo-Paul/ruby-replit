require_relative '../request'

class AccountCreate < Reepay::Request
  define_attribute 'company', String
end

account = AccountCreate.new('Google')
account.company = "Apple Co"
puts "the company: #{account.company}"
