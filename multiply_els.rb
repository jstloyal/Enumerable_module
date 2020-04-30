require_relative 'enumerable'

def multiply_els(arr)
  arr.my_inject(:*)
end

puts multiply_els([2, 4, 5])
