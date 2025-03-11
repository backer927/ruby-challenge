#!/usr/bin/env ruby

# Functional Programming Challenge in Ruby
#
# This challenge tests your ability to implement functional programming concepts in Ruby.
# You'll need to implement several functions that manipulate arrays and functions.
#
# Instructions:
# 1. Implement all the required methods below
# 2. Each method has a description and examples
# 3. Run the tests using: ruby functional_challenge_test.rb
#
# Time: 20-30 minutes

module FunctionalChallenge
  # Implement a method similar to Array#map but without using the built-in map method
  #
  # @param array [Array] The input array
  # @param block [Proc] The block to apply to each element
  # @return [Array] A new array with the block applied to each element
  #
  # Example:
  #   my_map([1, 2, 3]) { |x| x * 2 } # => [2, 4, 6]
  def self.my_map(array, &block)
    # Your code here
  end

  # Implement a method similar to Array#filter but without using the built-in select/filter methods
  #
  # @param array [Array] The input array
  # @param block [Proc] The block that returns true/false for each element
  # @return [Array] A new array with only the elements that pass the filter
  #
  # Example:
  #   my_filter([1, 2, 3, 4]) { |x| x.even? } # => [2, 4]
  def self.my_filter(array, &block)
    # Your code here
  end

  # Implement a method similar to Array#reduce but without using the built-in reduce/inject methods
  #
  # @param array [Array] The input array
  # @param initial [Object, nil] The initial value (optional)
  # @param block [Proc] The block that takes accumulator and current value
  # @return [Object] The final accumulated value
  #
  # Example:
  #   my_reduce([1, 2, 3], 0) { |acc, x| acc + x } # => 6
  def self.my_reduce(array, initial = nil, &block)
    # Your code here
  end

  # Compose multiple functions together
  # Each function consumes the return value of the function that follows
  #
  # @param funcs [Array<Proc>] The functions to compose
  # @return [Proc] A new function that is the composition of the input functions
  #
  # Example:
  #   add_one = ->(x) { x + 1 }
  #   multiply_by_two = ->(x) { x * 2 }
  #   composed = compose(add_one, multiply_by_two)
  #   composed.call(5) # => 11 (5 * 2 + 1)
  def self.compose(*funcs)
    # Your code here
  end

  # Create a function that applies functions in sequence (pipe)
  # Each function consumes the return value of the function that precedes it
  #
  # @param funcs [Array<Proc>] The functions to pipe
  # @return [Proc] A new function that is the pipe of the input functions
  #
  # Example:
  #   add_one = ->(x) { x + 1 }
  #   multiply_by_two = ->(x) { x * 2 }
  #   piped = pipe(add_one, multiply_by_two)
  #   piped.call(5) # => 12 ((5 + 1) * 2)
  def self.pipe(*funcs)
    # Your code here
  end

  # Create a memoized version of a function
  # The function should cache its results for the same inputs
  #
  # @param func [Proc] The function to memoize
  # @return [Proc] A memoized version of the function
  #
  # Example:
  #   fibonacci = memoize do |n|
  #     n <= 1 ? n : fibonacci.call(n-1) + fibonacci.call(n-2)
  #   end
  #   fibonacci.call(10) # => 55 (much faster than without memoization)
  def self.memoize(func = nil, &block)
    # Your code here
  end

  # The tricky one: Implement a curry function
  # This should transform a function that takes multiple arguments into a sequence
  # of functions that each take a single argument
  #
  # @param func [Proc] The function to curry
  # @param arity [Integer, nil] The arity of the function (optional)
  # @return [Proc] A curried version of the function
  #
  # Example:
  #   add = ->(a, b, c) { a + b + c }
  #   curried_add = curry(add)
  #   curried_add.call(1).call(2).call(3) # => 6
  #   curried_add.call(1, 2).call(3) # => 6
  #   curried_add.call(1).call(2, 3) # => 6
  def self.curry(func, arity = nil)
    # Your code here
  end
end 