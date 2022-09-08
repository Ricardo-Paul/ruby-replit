require 'etc'

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
	def initialize(real_object, username)
		@real_object = real_object
    @username = username
	end
  
	def deposit(amount)
    check_access("deposit")
		@real_object.deposit(amount)
	end
  
  def balance
    check_access("balance check")
    @real_object.balance
  end
  
  def check_access(action)
    # unless Etc.getlogin == @username raise "Error"
    if Etc.getlogin != @username
      raise "Permission error: cannot perform #{action}"
    end
  end
end

# client code
acc = BankAccount.new
acc.deposit(8000)
puts acc.balance

accProxy = BankAccountProxy.new(acc, "runner")
accProxy.deposit(1200)
puts accProxy.balance

puts Etc.getlogin