module Enumerable 
  def my_each
    return enum_for unless block_given?
    arr = is_a?(Range) ? to_a : self
    i = 0
    while i < arr.length
      yield(arr[i])
      i += 1
    end
    self
  end

  def my_each_with_index(x, y)
    return empty? unless block_given?
    x = is_a?(Range) ? to_a : self
    i = 0
    while i < x.length
      yield(x[i])
      i += 1
    end
  end
end

