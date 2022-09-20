class Frog
end

class Algae
end

class Tiger
  def initialize
    puts "A new tiger"
  end
end

class Tree
  def initialize
    puts "A new tree"
  end
end

# concrete factories that produce compatible products
# a pond can have frogs and algae

# class PondOrganismFactory
#   def new_animal(name)
#     Frog.new
#   end
#   def new_plant(name)
#     Algae.new
#   end
# end

#  a jungle can have tigers and trees

# class JungleOrganismFactory
#   def new_animal(name)
#     Tiger.new
#   end
#   def new_plant(name)
#     Tree.new
#   end
# end

# combine concrete factories
class OrganismFactory
  def initialize(animal_class, plant_class)
    @animal_class = animal_class
    @plant_class = plant_class
  end

  def new_animal(name)
    @animal_class.new
  end

  def new_plant(name)
    @plant_class.new
  end
end

class Habitat
  attr_accessor :animals, :plants
  def initialize(animal_count, plant_count, abstract_factory)
    @abstract_factory = abstract_factory
    @animals = []
    animal_count.times do |i|
      animal = @abstract_factory.new_animal("Ani#{i}")
      @animals << animal
    end

    @plants = []
    plant_count.times do |i|
      plant = @abstract_factory.new_plant("Plant#{i}")
      @plants << plant
    end
  end
end

# jungle = Habitat.new(2, 3, JungleOrganismFactory.new)
jungle = Habitat.new(2, 3, OrganismFactory.new(Tiger, Tree))