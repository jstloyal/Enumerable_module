require_relative 'enumerable'

# 1. my_each
puts 'my_each'
puts '-------'
puts([1, 2, 3].my_each { |elem| print "#{elem + 1} " })
puts

# 2. my_each_with_index
puts 'my_each_with_index'
puts '------------------'
print([1, 2, 3].my_each_with_index { |elem, idx| puts "#{elem} : #{idx}" })
puts

# 3. my_select
puts 'my_select'
puts '---------'
p [1, 2, 3, 8].my_select(&:even?)
p([0, 2018, 1994, -7].my_select(&:positive?))
p [6, 11, 13].my_select(&:odd?)
puts

# 4. my_all?
puts 'my_all?'
puts '-------'
p [3, 5, 7, 11].my_all?(&:odd?)
p([-8, -9, -6].my_all?(&:negative?))
p [3, 5, 8, 11].my_all?(&:odd?)
p([-8, -9, -6, 0].my_all?(&:negative?))
p [1, 2, 3, 4, 5].my_all?
p [1, 2, 3].my_all?(Integer)
p %w[dog door rod blade].my_all?(/d/)
puts

# 5. my_any?
puts 'my_any?'
puts '-------'
p [7, 10, 3, 5].my_any?(&:even?)
p [7, 10, 4, 5].my_any?(&:even?)
p(%w[q r s i].my_any? { |char| 'aeiou'.include?(char) })
p [7, 11, 3, 5].my_any?(&:even?)
p(%w[q r s t].my_any? { |char| 'aeiou'.include?(char) })
puts

# 6. my_none?
puts 'my_none?'
puts '--------'
p [3, 5, 7, 11].my_none?(&:even?)
p(%w[sushi pizza burrito].my_none? { |word| word[0] == 'a' })
p [3, 5, 4, 7, 11].my_none?(&:even?)
p(%w[asparagus sushi pizza apple burrito].my_none? { |word| word[0] == 'a' })
p [1, 2, 3].my_none?
puts

# # 7. my_count
puts 'my_count'
puts '--------'
p [1, 4, 3, 8].my_count(&:even?)
p(%w[DANIEL JIA KRITI dave].my_count { |s| s == s.upcase })
p(%w[daniel jia kriti dave].my_count { |s| s == s.upcase })
p [1, 2, 3].my_count
p [1, 1, 1, 2, 3].my_count(1)
puts

# # 8. my_map
puts 'my_map'
puts '------'
p([1, 2, 3].my_map { |n| 2 * n })
p(%w[Hey Jude].my_map { |word| word + '?' })
p [false, true].my_map(&:!)
p [2, 44, 21, 7].my_map
my_proc = Proc.new { |num| num > 10 }
p [18, 22, 5, 6].my_map(my_proc) { |num| num < 10 }
puts

# 9. my_inject
puts 'my_inject'
puts '---------'
p [1, 2, 3, 4].my_inject(10) { |accum, elem| accum + elem }
p([1, 2, 3, 4].my_inject { |accum, elem| accum + elem })
p [5, 1, 2].my_inject('+')
p (5..10).my_inject(2, :*)
p (5..10).my_inject(4) { |prod, n| prod * n }
puts
