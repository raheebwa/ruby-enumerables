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
      if yield(self[i]) == false || yield(self[i]) == nil
        return false
      end
      i += 1
    end
    true
  end

  def my_any? 
    i = 0
    while i < length
      if yield(self[i])
        return false
      end
      i += 1
    end
    true
  end

  def my_none?
    i = 0
    while i < length
      if yield(self[i])
        return true
      end
      i += 1
    end
    false
  end

  def my_count
     i = 0
    count = []

    if block_given?
      while i < self.length
        if yield(self[i])
          count << self[i]
        end
        i += 1
      end
      return count.length
    end
    self.length
  end

  def my_map block=nil
    
    mapped_arr = []
     if block
        self.my_each_with_index {|elem,index| mapped_arr[index] = block.call(elem)}
      else
        self.my_each_with_index {|elem,index| mapped_arr[index] = yield(elem)}
      end
    mapped_arr
  end

  def my_inject initial = nil
      initial == nil ? result = self[0] : result = initial
  
      for i in 1..self.length - 1 
        result = yield(result,self[i])
      end 
      result
    end
end
