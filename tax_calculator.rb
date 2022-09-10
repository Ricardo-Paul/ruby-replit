class TaxCalculator
   def initialize(name, &block)
     @name, @block = name, block
   end

  def calculate_tax(amount)
    # closure
    "#{@name} is #{@block.call(amount)} USD"
  end
end

puts "=== TaxCalculator ==="
sales_tax_calc = TaxCalculator.new("Sales Tax") {|p| p * 5}

puts sales_tax_calc.calculate_tax(4)