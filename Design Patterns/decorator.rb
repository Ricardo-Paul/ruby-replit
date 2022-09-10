class SimpleWriter
  attr_reader :file
	def initialize(path)
		@file = File.open(path, 'w')
	end
	def write_line(line)
		@file.print(line + "\n")
	end
	# def timestamping_write_line(text)
	# 	write_line("#{Time.new}: #{text}")
	# end
	def close
		@file.close
	end
end

class NumberingWriter
  def initialize(real_writer)
    @real_writer = real_writer
    @line_number = 1
  end

  def write_line(line)
    @real_writer.write_line("#{@line_number} #{line}")
    log
    @line_number += 1
  end

  def log
    puts "#{@real_writer.file.path} has been modified"
  end
end

# Now we can use our enhanced writer to write the way we want
simple_writer = SimpleWriter.new('./Design Patterns/textfile.txt')
numbering_writer = NumberingWriter.new(simple_writer)

numbering_writer.write_line("Adapter Pattern")
numbering_writer.write_line("Command Pattern")