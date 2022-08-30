class ArrayIterator
  def initialize(array)
    @array = array
    @index = 0
  end

  def item
    @array[@index]
  end

  def has_next?
    @index < @array.length
  end

  def next_item
    value = @array[@index] # starts at 0
    @index += 1
    value # returns first element
  end
end

patterns = ['composite', 'iterator', 'observer']
iterator = ArrayIterator.new('Ricardo')

while iterator.has_next?
  puts iterator.next_item
end

# Internal Iterator
def each_element(array)
	i = 0
	while i < array.length
		yield(array[i])
		i += 1
	end
end
patterns = ['Template Method', 'Strategy', 'Observer']
each_element(patterns) {|p| puts(p)}

class Portfolio
  include Enumerable
  attr_reader :accounts
  def initialize
    @accounts = []
  end
  def each(&block)
    @accounts.each(&block)
  end
  def add_account(account)
    @accounts << account
  end
end

class Account
  attr_reader :name, :balance
  def initialize(name, balance)
    @name = name
    @balance = balance
  end
  def <=>(other)
    balance <=> other.balance
  end
end

portfolio = Portfolio.new
jane_doe = Account.new('Jane', 2000)
portfolio.add_account(jane_doe)

accounts = portfolio.all?{|acc| acc.balance > 100}
puts accounts