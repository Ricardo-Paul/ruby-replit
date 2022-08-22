class TaxCalculator
   def initialize(name, &block)
     @name, @block = name, block
   end

  def calculate_tax(amount)
    # the bock provided to the class is where the calculation happens
    "#{@name} is #{@block.call(amount)}"
  end
end

puts "=== working with TaxCalculator ==="
tx = TaxCalculator.new("Sales Tax") {|amount| amount * 5}

puts tx.calculate_tax(5)