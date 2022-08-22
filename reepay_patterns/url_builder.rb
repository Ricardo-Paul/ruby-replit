# ruby lambda
# lambda_name = -> () {}

build_url = -> (prefix, **options) do
  puts "the prefix :#{prefix.upcase}"
  options.each do |key, value|
    puts "#{key} - #{value}"
  end
end


begin
  puts "Using ruby lambda Not Google s LMAda"
end

# Calling a lambda, one of the various ways
build_url.(:reepay_api, host: 'localhost')

# &method allows to pass each element in an array as arg
["Reepay", 'Engineering'].map(&method(:puts))

# index_by is a rails method
h = [{domain: 'us', id: 4}, {domain: 'eu', id: 34}].index_by(&:id)
puts h
# {4 => {domain: 'us', id: 4}, 34 => {domain: 'eu', id: 34}}