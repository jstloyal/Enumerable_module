module Enumerable
  def my_each
    return enum_for unless block_given?

    arr = is_a?(Range) ? to_a : self
    i = 0
    while i < arr.size
      yield(arr[i])
      i += 1
    end
    
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
        my_each { |item| return true if item =~ args[0] }
      elsif args[0].is_a?(Class)
        my_each { |item| return true if item.is_a?(args[0]) }
      else args[0].is_a?(Object)
        my_each { |item| return true if item == args[0] }
      end
      return false
    end

    unless block_given?
      i = 0
      while i < arr.size
        return true if arr[i] != false && !arr[i].nil?
        i += 1
      end
      return false
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

  def my_map(proc = nil)
    new_array = []
    if proc.nil?
      return enum_for unless block_given?
      my_each { |item| new_array << yield(item) }
    else
      my_each { |item| new_array << proc.call(item) }
    end
    new_array
  end

  def my_inject(*args)
    arr = is_a?(Range) ? to_a : self
    if args.count == 0
      total = arr[0]
      i = 1
      while i < arr.size
        total = yield(total, arr[i])
        i += 1
      end
    elsif args.count == 1
      if args[0].is_a?(Numeric)
       total = args[0]
       i = 0
       while i < arr.size
        total = yield(total, arr[i])
        i += 1
       end
      else args[0].is_a?(Symbol) || args[0].is_a?(String)
        action = args[0].is_a?(String) ? args[0].to_sym : args[0]
        total = arr[0]
        i = 1
        while i < arr.size
          total = total.send(action, arr[i])
          i += 1
        end
      end
    elsif args.count == 2
      total = args[0]
      action = args[1].is_a?(String) ? args[1].to_sym : args[1]   
      i = 0
      while i < arr.size
        total = total.send(action, arr[i])
        i += 1
      end
    end
    total
	end
end
