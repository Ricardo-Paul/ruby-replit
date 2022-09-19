# Product - Duck
class Duck
  def initialize(name)
    @name = name
  end

  def eat
    puts "#{@name} is eating"
  end

  def speak
    puts "#{@name} says Quack!"
  end

  def sleep
    puts "#{@name} is sleeping now"
  end
end

# Product - Frog
class Frog
  def initialize(name)
    @name = name
  end
  def eat
    puts "#{@name} is eating"
  end

  def speak
    puts "#{@name} says Croaaaak croaaak!"
  end

  def sleep
    puts "#{@name} does not sleep - Croaaking all night"
  end
end

# Product - Algae
class Algae
  def initialize(name)
    @name = name
  end

  def grow
    puts "The Algae #{@name} soaks up the sun and grows"
  end
end

# Product - Water Lily
class WaterLily
  def initialize(name)
    @name = name
  end

  def grow
    puts "The Walter Lily #{@name} floats, soaks up the sun and grows"
  end
end

# Creator - Pond
class Pond
  attr_reader :ducks
  def initialize(ducks_number)
    names = [:jane, :calix, :ally] #TODO move to subclass
    raise "Too many ducks" if ducks_number > names.length
    @animals = []
    ducks_number.times do |i|
      animal = new_animal("#{names[i]}")
      @animals << animal
    end
  end

  def simulate_one_day
    @animals.each do |animal|
      animal.eat
      animal.speak
      animal.sleep
    end
  end
end

# refactor: DuckPond subclass to pick the right class
# filling the blank for `new_animal` in the base class
# DuckPond - Concrete Creator
class DuckPond < Pond
  def new_animal(name)
    Duck.new(name)
  end
end

# FrongPond - Concrete Creator
class FrogPond < Pond
  def new_animal(name)
    Frog.new(name)
  end
end

duck_pond = DuckPond.new(3)
duck_pond.simulate_one_day

frog_pond = FrogPond.new(3)
frog_pond.simulate_one_day

puts "---- our frog #{frog = "Fruggy"}----"
[:eat, :speak, :sleep].each { |act| Frog.new(frog).send(act) }