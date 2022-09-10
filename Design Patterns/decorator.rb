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

# a base class for decorators
class WriterDecorator
  def initialize(real_writer)
    @real_writer = real_writer
  end

  def write_line(line)
    @real_writer.write_line(line)
  end
end

class NumberingWriter < WriterDecorator
  def initialize(real_writer)
    super(real_writer)
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

class ChecksummingWriter < WriterDecorator
  attr_reader :checksum
  
  def checksum
    puts "checksum of string '#{@line}': #{@checksum}"
    @checksum
  end
  
  def initialize(real_writer)
    super(real_writer)
    @checksum = 0
  end

  def write_line(line)
    @line = line
    line.each_byte do |byte|
      @checksum = (@checksum + byte) % 256
    end
    @real_writer.write_line(line)
  end
end

# Now we can use our enhanced writer to write the way we want
simple_writer = SimpleWriter.new('./Design Patterns/textfile.txt')
numbering_writer = NumberingWriter.new(simple_writer)

numbering_writer.write_line("Adapter Pattern")
numbering_writer.write_line("Decorator Pattern")

# checksumming writer
checksumming_writer = ChecksummingWriter.new(simple_writer)
checksumming_writer.write_line("Hello World")
puts checksumming_writer.checksum