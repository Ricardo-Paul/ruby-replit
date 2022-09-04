# Use the command pattern to design an installation software
# Installation program usually does different things on a user's system
# The goal is to be able to tell the user what we're doing on their system during each step
# We can use a composite object to contain all of our commands
# The composite command object will be our sender

require 'fileutils'

class Command
  attr_reader :description
  def initialize(description)
    @description = description
  end
  def execute
    raise NotImplementedError, 'not implemented'
  end
end

# command to create files
class CreateFile < Command
  attr_reader :path, :contents
  def initialize(path, contents)
    super("Creating file #{path}")
    @path = path
    @contents = contents
  end

  def execute
    file = File.open(path, "w")
    file.write(contents)
    file.close
  end
end

# command to delete files
class DeleteFile < Command
  attr_reader :path
  def initialize(path)
    super("Delete file #{path}")
    @path = path
  end

  def execute
    File.delete(path) if path
  end
end

# command to copy one file contents to another
class CopyFile < Command
  attr_reader :source, :target
  def initialize(source, target)
    super("copy file #{source} to file #{target}")
    @source = source
    @target = target
  end
  def execute
    FileUtils.copy(source, target)
  end
end

class CompositeCommand < Command
  attr_reader :commands
  def initialize
    @commands = []
  end
  def add_commands(commands)
    raise ArgumentError, 'Array arg needed' if !commands.kind_of?(Array)
    commands.each do |command|
      add_command(command)
    end
  end
  def add_command(command)
    commands << command
  end
  def execute
    commands.each { |c| c.execute }
  end
  def description
    description = ""
    commands.each{ |c| description += c.description + "...\n" }
    description
  end
end

# execute the command directly
create_file = CreateFile.new('./Design Patterns/text.txt', 'Gang of Four')
copy_file = CopyFile.new('./Design Patterns/text.txt', './Design Patterns/contents.txt')
delete_file = DeleteFile.new('./Design Patterns/text.txt')

# execute all commands through the composite object
cmds = CompositeCommand.new
cmds.add_commands([create_file, copy_file, delete_file])
cmds.execute

puts cmds.description