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

  def my_all?
    arr = is_a?(Range) ? to_a : self
    i = 0
    while i < arr.size
      yield(arr[i])
      return false unless yield(arr[i])

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
        return true if con == self[item]
      end
    else
      size.times do |item|
        return true if self[item]
      end
    end
    false
  end

  def my_none?
    unless block_given?
      my_each { |item| return false if item != false }
      return true
    end
    my_each do |item|
      return false if yield(item) == true
    end
    true
  end

  def my_map(element = nil)
    new_array = []

    my_each do |item|
      new_array << if block_given?
                     yield(item)
                   else
                     element.call(item)
                   end
    end

    new_array
  end
end
