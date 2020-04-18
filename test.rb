require_relative 'enumerable'

# 1. my_each
puts 'my_each'
puts '-------'
puts [1, 2, 3].my_each { |elem| print "#{elem + 1} " }
puts

# 2. my_each_with_index
puts 'my_each_with_index'
puts '------------------'
print [1, 2, 3].my_each_with_index { |elem, idx| puts "#{elem} : #{idx}" } 
puts

# 3. my_select
puts 'my_select'
puts '---------'
p [1, 2, 3, 8].my_select(&:even?) 
p [0, 2018, 1994, -7].my_select { |n| n > 0 } 
p [6, 11, 13].my_select(&:odd?) 
puts
