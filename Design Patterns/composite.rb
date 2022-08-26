
#  This is a common base class for our subtasks
class Task
  attr_reader :name
  def initialize(name)
    @name = name
  end

  def get_time_required
    0.0
  end
end

# our subtasks
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

# a composite task
class MakeBatterTask < Task
  def initialize
    super('Make batter')
    @subtasks = []
    add_subtask( AddDryIngredientsTask.new )
    add_subtask( MixTask.new )
    add_subtask( AddLiquidIngredientsTask.new )
  end

  def add_subtask(task)
    @subtasks << task
  end

  def remove_subtask(task)
    @subtasks.delete(task)
  end

  def get_time_required
    time = 0.0
    puts(@subtasks)
    @subtasks.each { |sub_task| time += sub_task.get_time_required }
    time
  end
end

puts MakeBatterTask.new.get_time_required