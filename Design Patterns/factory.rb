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
# it's only implementing `new_animal` to provide the Duck class to the superclass
class DuckPond < Pond
  def new_animal(name)
    Duck.new(name)
  end
end

class FrogPond < Pond
  def new_animal(name)
    Frog.new(name)
  end
end

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

duck_pond = DuckPond.new(3)
duck_pond.simulate_one_day

frog_pond = FrogPond.new(3)
frog_pond.simulate_one_day

puts "---- our frog #{frog = "Fruggy"}----"
[:eat, :speak, :sleep].each { |act| Frog.new(frog).send(act) }

