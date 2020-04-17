module Enumerable 
  def my_each
    return enum_for unless block_given?
    arr = is_a?(Range) ? to_a : self
    i = 0
    while i < arr.size
      yield(arr[i])
      i += 1
    end
    self
  end

  def my_each_with_index
    return enum_for unless block_given?

    arr = is_a?(Range) ? to_a : self
   
    i = 0
    while i < arr.size
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
    while i < arr.size
      count += 1 if yield(arr[i])
      i += 1
    end
   count
  end

  def my_select
    return enum_for unless block_given?
    arr = is_a?(Range) ? to_a : self
    count = []
    i = 0
    while i < arr.size
      count << arr[i] if yield(arr[i])
      i += 1
    end
    count
  end

  def my_all?()

    arr = is_a?(Range) ? to_a : self
    i = 0
    while i < arr.size
      yield(arr[i])
      return false if !yield(arr[i])
      i += 1
    end
    true
  end

  def my_any?(con = false)
    if block_given?
      size.times do |item|
        result = yield(self[item])
        (return true) if result
      end
    elsif con
      size.times do |item|
        return true if con === self[item]
      end
    else
      size.times do |item|
        return true if self[item]
      end
    end
    false
  end

 
  
end

