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

  def my_count(*args)
    if args.count.positive?
      c = 0
      my_each { |item| c += 1 if item == args[0] }
      return c
    end
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

  def my_all?(*args)
    arr = is_a?(Range) ? to_a : self
    if args.count.positive? 
      if args[0].class.name == 'Regexp'
        my_each { |item| return false if (item =~ args[0]).nil? }
      elsif args[0].is_a?(Class)
        my_each { |item| return false unless item.is_a?(args[0]) }
      else args[0].is_a?(Object)
        my_each { |item| return false unless item == args[0] }
      end
      return true
    end
    unless block_given?
      i = 0
      while i < arr.size
        return false if arr[i] == false || arr[i].nil?
        i += 1
      end
      return true
    end
    i = 0
    while i < arr.size
      return false unless yield(arr[i])

      i += 1
    end
    true
  end

  def my_any?(*args)
    arr = is_a?(Range) ? to_a : self
    if args.count.positive? 
      if args[0].class.name == 'Regexp'
        my_each { |item| return false if (item =~ args[0]).nil? }
      elsif args[0].is_a?(Class)
        my_each { |item| return true unless item.is_a?(args[0]) }
      else args[0].is_a?(Object)
        my_each { |item| return true unless item == args[0] }
      end
      return true
    end

    unless block_given?
      i = 0
      while i < arr.size
        return false if arr[i] == false || arr[i].nil?
        i += 1
      end
      return true
    end

    i = 0
    while i < arr.size
      return true if yield(arr[i])

      i += 1
    end   
    false
  end

  def my_none?(*args)
    if args.count.positive? 
      if args[0].class.name == 'Regexp'
        my_each { |item| return false if (item =~ args[0]).nil? }
      elsif args[0].is_a?(Class)
        my_each { |item| return true unless item.is_a?(args[0]) }
      else args[0].is_a?(Object)
        my_each { |item| return false if item == args[0] }
      end
      return true
    end
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
    return enum_for unless block_given?
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
