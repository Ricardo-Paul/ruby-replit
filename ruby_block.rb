def callBlock
  yield "Hello world"
end

callBlock {|name |puts "call me #{name}"}


puts 2.upto(4)
puts 5.times
puts (1..5).each

puts  ('a'..'g').each { |letter| puts letter }

puts "What is your name ?"
name = gets
puts "Ohh your name is #{name}"

# while gets 
#   if /Ruby/
#     print 
#   end
# end

# ARGF.each{|line| puts line if /Ruby/ =~ line }

arr = %w(these are array elements)
arr[6] = [1, 3]
puts arr