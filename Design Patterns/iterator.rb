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
iterator = ArrayIterator.new(patterns)

while iterator.has_next?
  puts iterator.next_item
end
