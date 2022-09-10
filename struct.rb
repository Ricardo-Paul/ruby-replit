require 'set'
Customer = Struct.new(:name, :address, :zip) do
  def greeting
    puts "Customer name is #{name}"
  end
end

# Class equivalent
# class Customer
#   def initialize(name)
#     @name = name
#   end
#   def greeting
#     puts "Customer name is #{name}"
#   end
# end

puts Customer.new("Russ").greeting

puts Set.new %w(
  1, 2, 3
)