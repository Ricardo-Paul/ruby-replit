puts "Hello Ruby class"
num = -444
puts "Absolute number of #{num} is #{num.abs}"

def say_goodnight(name)
  # getting rid of the return line
  "Goodnight #{name}"
end

puts say_goodnight("Matz")

# Me wriring some code
# just using an empty array instead of a loop
arr = Array.new(4)
arr.each{ puts say_goodnight("doe")}

my_arr = %W(elements of the array are here)
my_arr.unshift("Go") #placing an element at the beginning
puts my_arr[0]

# prevent the hash from returning nil if item is not found
projects_hash = Hash.new(0)
projects_hash["health"] = "Medico Plus"
puts projects_hash["hello"]

# this is the statement modifier syntax
puts "we have some projects" if projects_hash.length > 0

line = "Ruby On Rails Rails Rails"
if line =~ /Rails/
  puts line.gsub(/Rails/, "Road")
else
  puts line
end