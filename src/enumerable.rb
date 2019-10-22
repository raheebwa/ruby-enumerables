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

  # def my_each_with_index

  # end

  # def my_select

  # end

  # def my_all # bool
  # end

  # def my_any # bool

  # end

  # def my_none #bool

  # end

  # def my_map
  # end

  # def my_inject
  # end
end
