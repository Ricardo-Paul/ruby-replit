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

class AccountProtectionProxy
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

class VirtualAccountProxy
  def initialize(starting_balance = 0)
    @starting_balance = starting_balance
  end

  # delay the subject instantiation until the client needs it
  def deposit(amount)
    s = subject
    s.deposit(amount)
  end

  def balance
    s = subject
    s.balance
  end

  def subject
    @subject || (@subject = BankAccount.new(@starting_balance))
  end

end

# client code
# simple proxy
acc = BankAccount.new
acc.deposit(8000)
puts acc.balance

# protection proxy
accProxy = AccountProtectionProxy.new(acc, "runner")
accProxy.deposit(1200)
puts accProxy.balance

# virtual proxy
accVirtProxy = VirtualAccountProxy.new(0)
accVirtProxy.deposit(3000)
puts accVirtProxy.balance