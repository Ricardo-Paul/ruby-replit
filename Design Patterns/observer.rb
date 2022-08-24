class Employee
  attr_reader :salary, :name
  def initialize(name, title, salary, payroll)
    @name = name
    @title = title
    @salary = salary
    @payroll = payroll
  end

  def salary=(new_salary)
    @salary = new_salary
    @payroll.update( self )
  end
end

class Payroll
  def update(employee)
    puts "Employee #{employee.name} new salary is #{employee.salary}"
  end
end

payroll = Payroll.new
employee = Employee.new('Russ', 'Doe', 1500, payroll)
puts(employee.inspect)
employee.salary=3500