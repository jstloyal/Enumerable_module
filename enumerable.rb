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

  def my_each_with_index
    return enum_for unless block_given?

    arr = is_a?(Range) ? to_a : self
   
    i = 0
    while i < arr.length
      yield(arr[i], i)
      i += 1
    end
    self
  end

  def my_count
    return length unless block_given?
  
    arr = is_a?(Range) ? to_a : self
    count = 0
    i = 0
    while i < arr.length
      count += 1 if yield(arr[i])
      i += 1
    end
   count
  end
  
end

