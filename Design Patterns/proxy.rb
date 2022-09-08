class BankAccount
  attr_reader :balance
	def initialize(starting_bal = 0)
		@balance = starting_bal
	end
	def deposit(amount)
		@balance += amount
	end
end

class BankAccountProxy
	def initialize(real_object)
		@real_object = real_object
	end
	def deposit(amount)
		@real_object.deposit(amount)
	end
  def balance
    @real_object.balance
  end
end

acc = BankAccount.new
acc.deposit(8000)
puts acc.balance

accProxy = BankAccountProxy.new(acc)
puts accProxy.balance