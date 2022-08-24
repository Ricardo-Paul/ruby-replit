# Using some ruby feature to improve the strategy pattern

# Our strategy classes are currently implemented as ruby classes, classes are objects that contain code, so are Procs. We can then switch to a proc-based implementation. Eliminating the needs for classes altogether.

# So now we don’t have a class with a method to call, but just a Proc to call.

HTML_FORMATTER = lambda do |context|
	puts("<title>#{context.title}</title>")
	context.books.each do |book|
		puts("<item>#{book}</item>")
	end
end

PlainTextFormatter = lambda do |context|
	puts(context.title)
	context.books.each do |book|
		puts(book)
	end
end

class Report
	attr_reader :title, :books

	def initialize(&formatter)
		@title = "The monthly Report"
		@books = ['Gang of Four', 'Ruby Design Patterns']
		@formatter = formatter
	end

	def output_report
		@formatter.call(self)
	end
end

report = Report.new(&HTML_FORMATTER)
report.output_report

# creating our PlainTextFormatter on the fly
# that is one advantage we have with the Proc-based implementaion
report2 = Report.new do |context|
  puts(context.title)
	context.books.each do |book|
		puts(book)
	end
end
report2.output_report

# What have we achieved?

# In the beginning we had to use a base Strategy class, some concrete strategies and a context.

# Now we’re only using a context and some procs instead of concrete classes.