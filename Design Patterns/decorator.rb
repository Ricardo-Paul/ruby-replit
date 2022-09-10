class EnhancedWriter
	def initialize(path)
		@file = File.open(path, 'w')
	end
	def write_line(line)
		@file.print(line + "\n")
	end
	def timestamping_write_line(text)
		write_line("#{Time.new}: #{text}")
	end
	# and so on
	def close
		@file.close
	end
end

# Now we can use our enhanced writer to write the way we want
writer = EnhancedWriter.new('./Design Patterns/textfile.txt')
writer.write_line('Plain text')

# OR
writer.timestamping_write_line('Line with timestamp')