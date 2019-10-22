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

  def my_all? # bool
    i = 0
    while i < length
      if yield(self[i]) == false || yield(self[i]) == nil
        return false
      end
      i += 1
    end
    true
  end

  # def my_any # bool

  # end

  # def my_none #bool

  # end

  # def my_map
  # end

  # def my_inject
  # end
end
