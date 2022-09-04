# Objects name: Client | Target | Adapter | Adaptee
# our client object. the encrypt method is expecting a reader which is an IO object (a target) with methods eof? and getc. It is assuming that the reader is a file (with text we want to encrypt) opened for reading and thus accessing the eof? and getc methods. What if we want to get our text from a string instead? That means we would like our reader not to be an actual IO object but it should respond to the same methods our client is expecting. The answer here is we need an adapter class - StringIOAdapter and burried inside our adapter is an adaptee object, our string.
class Encrypter
  def initialize(key)
    @key = key
  end

  def encrypt(reader, writer)
    key_index = 0
    while not reader.eof?
      clear_char = reader.getc
      # using random encryted char for the sake of example
      encrypted_char = "099"
      writer.putc(encrypted_char)
      key_index = (key_index + 1) % @key.size
    end
  end
end

class StringIOAdapter
  def initialize(string)
    @string = string
    @position = 0
  end
  def getc
    if @position >= @string.length
      raise EOFError
    end
    char = @string[@position]
    @position += 1
    char
  end
  def eof?
    @position >= @string.length
  end
end

reader = StringIOAdapter.new("My string")
# while not reader.eof?
#   puts reader.getc
# end

# replace the reader
# reader = File.open('Design Patterns/message.txt')
writer = File.open('Design Patterns/message.encrypted','w')

encrypter = Encrypter.new('my secret key')
encrypter.encrypt(reader, writer)