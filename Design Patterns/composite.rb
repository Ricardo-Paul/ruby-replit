
#  This is a common base class for our subtasks
class Task
  attr_accessor :name, :parent
  def initialize(name)
    @name = name
    @parent = nil
  end

  def get_time_required
    0.0
  end
end

# our subtasks (leaf)
# AddDryIngredientsTask MixTask AddLiquidIngredientsTask
class AddDryIngredientsTask < Task
  def initialize
    super('Add dry ingredients')
  end

  def get_time_required
    2.0
  end
end

class MixTask < Task
  def initialize
    super('Mix Task')
  end

  def get_time_required
    5.0
  end
end

class AddLiquidIngredientsTask < Task
  def initialize
    super('Mix Task')
  end

  def get_time_required
    5.0
  end
end

# factoring out the code that manages substasks
class Composite < Task
  def initialize(name)
    super(name)
    @subtasks = []
  end

  def << (task)
    task.parent = self
    @subtasks << task
    log(task)
    task
  end

  def [](task)
    if task.kind_of? Integer
      @subtasks[task]
    end
  end

  def []=(index, task)
    @subtasks[index] = task
  end

  def log(task)
    puts("[NEW TASK]: , #{task} #{self}")
    puts("[all subtasks #{@subtasks.length}], #{@subtasks}")
  end

  def remove_subtask(task)
    @subtasks.delete(task)
  end

  def get_time_required
    time = 0.0
    puts("subtasks length :", @subtasks.length)
    @subtasks.each { |sub_task| time += sub_task.get_time_required }
    time
  end
end

# a composite task
class MakeBatterTask < Composite
  def initialize(name)
    super(name)
    # add_substask replaced by << method in the superclass
    # add_subtask( AddDryIngredientsTask.new )
    # add_subtask( AddLiquidIngredientsTask.new )
  end
end

make_batter = MakeBatterTask.new('Make batter')
make_batter << MixTask.new
make_batter << AddDryIngredientsTask.new
puts "second subtask in make batter #{make_batter[1]}"