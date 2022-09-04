class TextObject
  attr_reader :text, :size_inches, :color
  def initialize
    @text = "my text"
    @size_inches = 2.5
    @color = "red"
  end
end

class Renderer
  def render(text_object)
    puts "TEXT: #{text_object.text}"
    puts "SIZE: #{text_object.size_inches}"
    puts "COLOR: #{text_object.color}"
  end
end

# BritishTextObject doesn't fit the Renderer interface, our Renderer needs a TextObject, apparently our renderer cannot render it. Need an adapter
class BritishTextObject
  attr_reader :string, :size_mm, :colour
  def initialize
    @string = "my british text"
    @size_mm = 63.5
    @colour = "blue"
  end
end

# Takes our BritishTextObject as the adaptee
class BritishTextObjectAdapter < TextObject
  def initialize(bto)
    @bto = bto
  end
  def text
    @bto.string
  end
  def size_inches
    @bto.size_mm / 25.4
  end
  def color
    @bto.colour
  end
end

# correct interface
renderer = Renderer.new.render(TextObject.new)

# using an adapter
british_text_object = BritishTextObject.new
text = BritishTextObjectAdapter.new(british_text_object)

# rendering
renderer2 = Renderer.new.render(text)