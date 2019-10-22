# frozen_string_literal: true

module Enumerable
  def my_each
    i = 0
    while i < length
      yield(self[i])
      i += 1
    end
    self
  end

  def my_each_with_index
    i = 0
    while i < length
      yield(self[i], i)
      i += 1
    end
    self
  end

  def my_select
    i = 0
    selected_arr = []
    while i < length
      selected_arr << self[i] if yield(self[i]) == true
      i += 1
    end
    selected_arr
  end

  def my_all?
    i = 0
    while i < length
      return false if yield(self[i]) == false || yield(self[i]).nil?

      i += 1
    end
    true
  end

  def my_any?
    i = 0
    while i < length
      return false if yield(self[i])

      i += 1
    end
    true
  end

  def my_none?
    i = 0
    while i < length
      return true if yield(self[i])

      i += 1
    end
    false
  end

  def my_count
    i = 0
    count = []

    if block_given?
      while i < length
        count << self[i] if yield(self[i])
        i += 1
      end
      return count.length
    end
    length
  end

  def my_map(block = nil)
    mapped_arr = []
    if block
      my_each_with_index { |elem, index| mapped_arr[index] = block.call(elem) }
    else
      my_each_with_index { |elem, index| mapped_arr[index] = yield(elem) }
    end
    mapped_arr
  end

  def my_inject(initial = nil)
    result = initial.nil? ? self[0] : initial

    (1..length - 1).each do |i|
      result = yield(result, self[i])
    end
    result
  end
end
