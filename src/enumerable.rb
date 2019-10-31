# frozen_string_literal: true

module Enumerable
  def my_each
    return to_enum unless block_given?

    i = 0
    while i < length
      yield(self[i])
      i += 1
    end
    self
  end

  def my_each_with_index
    return to_enum unless block_given?

    i = 0
    while i < length
      yield(self[i], i)
      i += 1
    end
    self
  end

  def my_select
    return to_enum unless block_given?

    i = 0
    selected_arr = []
    while i < length
      selected_arr << self[i] if yield(self[i]) == true
      i += 1
    end
    selected_arr
  end

  def my_all?(pattern = nil)
    if block_given?
      my_each { |obj| return false unless yield(obj) }
    elsif pattern
      my_each do |obj|
        return false unless matchers?(obj, pattern)
      end
    else
      my_each { |obj| return false unless obj }
      true
    end
    true
  end

  def my_any?(pattern = nil)
    if block_given?
      my_each { |obj| return true if yield(obj) }
    elsif pattern
      my_each do |obj|
        return true if matchers?(obj, pattern)
      end
    else
      my_each { |obj| return true if obj }
    end
    false
  end

  def my_none?(pattern = nil)
    if block_given?
      my_each { |obj| return false if yield(obj) }
    elsif pattern
      my_each do |obj|
        return false if matchers?(obj, pattern)
      end
    else
      my_each { |obj| return false if obj }
    end
    true
  end

  def my_count(item = nil)
    count = 0
    if block_given?
      my_each { |item_| count += 1 if yield(item_) }
    elsif item
      my_each { |item_| count += 1 if item_ == item }
    else
      count = length
    end
    count
  end

  def my_map(proc = nil)
    return to_enum unless block_given?

    result = []
    if proc
      my_each { |item| result << proc.call(item) }
    else
      my_each { |item| result << yield(item) }
    end

    result
  end

  def my_inject(*args)
    initial, sym = sanitize_params(*args)

    array = initial ? to_a : to_a[1..-1]
    initial ||= to_a[0]
    if block_given?
      array.my_each { |item| initial = yield(initial, item) }
    elsif sym
      array.my_each { |item| initial = initial.public_send(sym, item) }
    end
    initial
  end

  # def multiply_els(arr)
  #   arr.my_inject(:*)
  # end

  # Shared methods
  def matchers?(obj, pattern)
    (obj.respond_to?(:eql?) && obj.eql?(pattern)) ||
      (pattern.is_a?(Class) && obj.is_a?(pattern)) ||
      (pattern.is_a?(Regexp) && pattern.match(obj))
  end

  def sanitize_params(*args)
    initial, sym = nil
    args.each do |arg|
      initial = arg if arg.is_a? Numeric
      sym = arg unless arg.is_a? Numeric
    end
    [initial, sym]
  end
end
