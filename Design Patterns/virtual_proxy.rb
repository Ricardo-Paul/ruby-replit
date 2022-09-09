# Use ruby method_missing to create a Virtual Proxy that delays the creation of an array, or any object for that matter. - Generic
class VirtualProxy
	def initialize(&creation_block)
		@creation_block = creation_block
	end
	def method_missing(name, *args)
		s = subject
		s.send(name, *args)
	end
	def subject
		@subject ||= @creation_block.call
	end
end

array = VirtualProxy.new { Array.new }
array << "Design Patterns" # only creates the array when << is called
array << "Ruby on Rails"
puts array.inspect