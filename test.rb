# frozen_string_literal: true

load 'src/enumerable.rb'

def solve
  # TEST FOR #my_each
  # [1,2,3,4].my_each do |x|
  #  puts "#{x}"
  # end

  # TEST FOR #my_each_with_index
  # [1, 2, 3, 4].my_each_with_index do |x, i|
  #   puts "#{i} with index #{x}"
  # end

  # TEST FOR #my_select
  # numbers = [1, 2, 3, 4, 5, 6]
  # p numbers.my_select { |x| x.even? }
  # p numbers

  # TEST FOR #my_all?
  # numbers = [1, 2, 3, 4, 5]
  # p numbers.my_all? { |x| x < 6 }

  # TEST FOR #my_any?
  # numbers = [1, 2, 3, 4, 5, 6]
  # p numbers.my_any? { |x| x != 4 }

  # TEST FOR #my_none?
  # numbers = [1, 2, 3, 4, 5]
  # p numbers.my_none? {|x| x.is_a?(String) }

  # TEST FOR #my_count
  # strings = ["one", "two", "three", "four"]
  # p strings.my_count
  # p strings.count

  # TEST FOR #my_map
  array = [1, 2, 3]
  # p(array.my_map { |n| n * 2 })
  # #  Control
  # p(array.map { |n| n * 2 })
  my_proc = Proc.new { |x| "#{x} something to do" }
  p array.my_map(my_proc)

  # TEST FOR #my_inject
  # arr = [3, 6, 10, 13]
  # p(arr.my_inject {|sum, number| sum + number})
  # # Control
  # p(arr.inject{|sum, number| sum + number})
  
end

solve
