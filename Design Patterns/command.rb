class Button
  # expecting a code block
	def initialize(&block)
		@command = block
	end
	def execute
		@command.call if @command
	end
end

# we aren't calling this a button but a command, not a subclass
class SaveCommand
	def execute
		puts('running save logic')
	end
end

# Switching to proc-based command
# a proc object
SAVE_COMMAND = lambda do
  puts('running save logic - code block')
end

# convert the proc object to a codeblock
save = Button.new(&SAVE_COMMAND)
save.execute