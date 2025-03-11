#!/usr/bin/env ruby

require 'minitest/autorun'
require_relative 'functional_challenge'

class FunctionalChallengeTest < Minitest::Test
  def test_my_map
    assert_equal [2, 4, 6], FunctionalChallenge.my_map([1, 2, 3]) { |x| x * 2 }
    assert_equal ['a', 'b', 'c'], FunctionalChallenge.my_map(['A', 'B', 'C']) { |x| x.downcase }
    assert_equal [], FunctionalChallenge.my_map([]) { |x| x * 2 }
  end

  def test_my_filter
    assert_equal [2, 4], FunctionalChallenge.my_filter([1, 2, 3, 4]) { |x| x.even? }
    assert_equal [1, 3], FunctionalChallenge.my_filter([1, 2, 3, 4]) { |x| x.odd? }
    assert_equal [], FunctionalChallenge.my_filter([]) { |x| x.even? }
    assert_equal [], FunctionalChallenge.my_filter([1, 3, 5]) { |x| x.even? }
  end

  def test_my_reduce
    assert_equal 6, FunctionalChallenge.my_reduce([1, 2, 3], 0) { |acc, x| acc + x }
    assert_equal 6, FunctionalChallenge.my_reduce([1, 2, 3]) { |acc, x| acc + x }
    assert_equal 24, FunctionalChallenge.my_reduce([1, 2, 3, 4], 1) { |acc, x| acc * x }
    assert_equal 'abc', FunctionalChallenge.my_reduce(['a', 'b', 'c'], '') { |acc, x| acc + x }
    assert_equal nil, FunctionalChallenge.my_reduce([], nil) { |acc, x| acc + x }
  end

  def test_compose
    add_one = ->(x) { x + 1 }
    multiply_by_two = ->(x) { x * 2 }
    
    composed = FunctionalChallenge.compose(add_one, multiply_by_two)
    assert_equal 11, composed.call(5)  # (5 * 2) + 1 = 11
    
    composed_three = FunctionalChallenge.compose(add_one, multiply_by_two, ->(x) { x - 3 })
    assert_equal 5, composed_three.call(4)  # ((4 - 3) * 2) + 1 = 3
  end

  def test_pipe
    add_one = ->(x) { x + 1 }
    multiply_by_two = ->(x) { x * 2 }
    
    piped = FunctionalChallenge.pipe(add_one, multiply_by_two)
    assert_equal 12, piped.call(5)  # (5 + 1) * 2 = 12
    
    piped_three = FunctionalChallenge.pipe(add_one, multiply_by_two, ->(x) { x - 3 })
    assert_equal 9, piped_three.call(4)  # ((4 + 1) * 2) - 3 = 7
  end

  def test_memoize
    call_count = 0
    
    expensive_function = ->(x) {
      call_count += 1
      x * 2
    }
    
    memoized = FunctionalChallenge.memoize(expensive_function)
    
    assert_equal 10, memoized.call(5)
    assert_equal 1, call_count
    
    assert_equal 10, memoized.call(5)  # Should use cached result
    assert_equal 1, call_count  # Count should not increase
    
    assert_equal 20, memoized.call(10)  # New argument
    assert_equal 2, call_count  # Count should increase
  end

  def test_memoize_with_block
    call_count = 0
    
    memoized = FunctionalChallenge.memoize do |x|
      call_count += 1
      x * 2
    end
    
    assert_equal 10, memoized.call(5)
    assert_equal 1, call_count
    
    assert_equal 10, memoized.call(5)  # Should use cached result
    assert_equal 1, call_count  # Count should not increase
  end

  def test_memoize_fibonacci
    call_count = 0
    
    fibonacci = FunctionalChallenge.memoize do |n|
      call_count += 1
      if n <= 1
        n
      else
        fibonacci.call(n-1) + fibonacci.call(n-2)
      end
    end
    
    assert_equal 55, fibonacci.call(10)
    # Without memoization, this would call the function over 100 times
    assert call_count < 20, "Expected fewer than 20 calls, got #{call_count}"
  end

  def test_curry
    add = ->(a, b, c) { a + b + c }
    curried_add = FunctionalChallenge.curry(add)
    
    assert_equal 6, curried_add.call(1).call(2).call(3)
    assert_equal 6, curried_add.call(1, 2).call(3)
    assert_equal 6, curried_add.call(1).call(2, 3)
    assert_equal 6, curried_add.call(1, 2, 3)
    
    # Test with explicit arity
    curried_add_explicit = FunctionalChallenge.curry(add, 3)
    assert_equal 6, curried_add_explicit.call(1).call(2).call(3)
  end
end 