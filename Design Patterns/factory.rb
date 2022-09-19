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
    names = [:jane, :calix, :ally]
    raise "Too many ducks" if ducks_number > names.length
    @ducks = []
    ducks_number.times do |i|
        duck = Duck.new("#{names[i]}")
        @ducks << duck
    end
  end

  def simulate_one_day
    @ducks.each do |duck|
      duck.eat
      duck.speak
      duck.sleep
    end
  end
end

duck_pond = Pond.new(3)
duck_pond.simulate_one_day