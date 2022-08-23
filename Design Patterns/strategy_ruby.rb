# Using some ruby feature to improve the strategy pattern

# Our strategy classes are currently implemented as ruby classes, classes are objects that contain code, so are Procs. We can then switch to a proc-based implementation. Eliminating the needs for classes altogether.

# So now we don’t have a class with a method to call, but just a Proc to call.

HTMLFormatter = lambda do |context|
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

report = Report.new(&HTMLFormatter)
report.output_report