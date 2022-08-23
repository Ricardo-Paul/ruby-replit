# The stragegy pattern solves the same problem by using composition rather than inheritance
# We move the Template Method into specific objects called strategies that implement the entire method their own way rather than chunking the algorithm. All strategies implement a common interface.

# The Formatter superclass may not be that useful in
# ruby because of duck typing - ruby only cares that the child
# classes are in a certain shape. It doesn't care about their parents.

# class Formatter
# 	def output_report
# 		raise NotImplementedError
# 	end
# end

# Data comes from the context
class HTMLFormatter
	def output_report(context)
		puts("<title>#{context.title}</title>")
	end
end

# Data comes from the context
class PlainTextReport 
	def output_report(context)
		puts(context.title)
	end
end

class Report
  attr_reader :title
	def initialize(formatter)
		@formatter = formatter
    @title = 'Monthly Report'
	end

  # delegate to the strategy method
  def output_report
    @formatter.output_report(self)
  end
end

report = Report.new(HTMLFormatter.new)
report.output_report

hello = lambda { puts "Inside a proc" } # a Proc object

hello.call
puts(hello.class)