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
end

