class Employee
  attr_reader :salary, :name
  def initialize(name, title, salary)
    @name = name
    @title = title
    @salary = salary
    @observers = []
  end

  def add_observers(observers)
    observers.each do |observer|
      add_observer(observer)
    end
  end

  def add_observer(observer)
    @observers << observer
  end

  def remove_observer(observer)
    @observers.delete(observer)
  end

  # We are writing the setter by hand because we want to inform the payroll
  def salary=(new_salary)
    @salary = new_salary
    notify_observers
  end

  def notify_observers
    @observers.each do |observer|
      observer.update( self )
    end
  end
end

class Payroll
  def update(employee)
    puts "FROM PAYROLL"
    puts "Employee #{employee.name} new salary is #{employee.salary}"
  end
end

class TaxMan
  def update(employee)
    puts "FROM TAXMAN"
    puts "Employee #{employee.name} new salary is #{employee.salary}"
  end
end

# observers, interested in jim salary changes
payroll = Payroll.new
taxman = TaxMan.new

# Jim, the employee
jim = Employee.new('Russ', 'Doe', 1500)

jim.add_observers([payroll, taxman])

jim.salary=3500