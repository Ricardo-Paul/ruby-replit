# writing a report generator

class Report
  # The initialize method is common because Report formats will
  # use the same data
  def initialize
    @title = 'Patterns Learned Report'
    @patterns = ['Template Pattern', 'Strategy Pattern']
  end

  # what the template method does
  # output a title
  # output the body
  def output_report
    output_title
    output_body
  end

  def output_title
    raise NotImplementedError, 'output_title is abstract'
  end 

  def output_body
    @patterns.each do |pattern|
      output_line(pattern)
    end
  end

  def output_line(pattern)
    raise NotImplementedError, 'output_line is abstract'
  end
end

class HTMLReport < Report
  def output_title
    puts "<title>#{@title}</title>"
  end

  def output_line(pattern)
    puts "<item> #{pattern} </item>"
  end
end

class PlainReport < Report
  def output_title
    puts(@title)
  end

  def output_line(pattern)
    puts(pattern)
  end
end

HTMLReport.new.output_report
PlainReport.new.output_report