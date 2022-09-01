class Button
	def initialize(command)
		@command = command
	end
	def execute
		@command.execute
	end
end

# we aren't calling this a button but a command, not a subclass
class SaveCommand
	def execute
		puts('running save logic')
	end
end

save = Button.new(SaveCommand.new)
save.execute