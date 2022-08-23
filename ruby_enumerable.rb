class Array

    # size | length are methods in the Array class that returns the length of self
    # self refers to the Array object created
    # in our case it is the array literal 

    # see how we pick each element in self (array instance)
    # and pass them as argument to the block
  def find
    for i in 0...length
      value = self[i]
      return value if yield(value)
    end
    return nil
  end
end
nums = [1, 3, 5, 7, 9].find {|v| v*v > 30 }
puts nums

def addNumbers(n)
  return proc { |n2| n + n2 }
end

clos = addNumbers(10)
puts clos.call(24)