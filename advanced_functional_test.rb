#!/usr/bin/env ruby

require 'minitest/autorun'
require_relative 'advanced_functional'

class AdvancedFunctionalTest < Minitest::Test
  def test_memoize
    call_count = 0
    
    expensive_function = lambda do |x|
      call_count += 1
      x * 2
    end
    
    memoized = AdvancedFunctional.memoize do |x|
      expensive_function.call(x)
    end
    
    assert_equal 10, memoized.call(5)
    assert_equal 1, call_count
    
    assert_equal 10, memoized.call(5)  # Should use cached result
    assert_equal 1, call_count  # Count should not increase
    
    assert_equal 20, memoized.call(10)  # New argument
    assert_equal 2, call_count  # Count should increase
    
    # Test with multiple arguments
    multi_arg_memoized = AdvancedFunctional.memoize do |a, b|
      call_count += 1
      a + b
    end
    
    assert_equal 5, multi_arg_memoized.call(2, 3)
    assert_equal 3, call_count
    
    assert_equal 5, multi_arg_memoized.call(2, 3)
    assert_equal 3, call_count  # Should not increase
  end
  
  def test_compose
    add_one = ->(x) { x + 1 }
    multiply_by_two = ->(x) { x * 2 }
    subtract_three = ->(x) { x - 3 }
    
    # Test with two functions
    composed = AdvancedFunctional.compose(add_one, multiply_by_two)
    assert_equal 11, composed.call(5)  # (5 * 2) + 1 = 11
    
    # Test with three functions
    composed_three = AdvancedFunctional.compose(add_one, multiply_by_two, subtract_three)
    assert_equal 3, composed_three.call(4)  # ((4 - 3) * 2) + 1 = 3
    
    # Test with no functions
    composed_none = AdvancedFunctional.compose()
    assert_equal 5, composed_none.call(5)  # Identity function
  end
  
  def test_pipe
    add_one = ->(x) { x + 1 }
    multiply_by_two = ->(x) { x * 2 }
    subtract_three = ->(x) { x - 3 }
    
    # Test with two functions
    piped = AdvancedFunctional.pipe(add_one, multiply_by_two)
    assert_equal 12, piped.call(5)  # (5 + 1) * 2 = 12
    
    # Test with three functions
    piped_three = AdvancedFunctional.pipe(add_one, multiply_by_two, subtract_three)
    assert_equal 7, piped_three.call(4)  # ((4 + 1) * 2) - 3 = 7
    
    # Test with no functions
    piped_none = AdvancedFunctional.pipe()
    assert_equal 5, piped_none.call(5)  # Identity function
  end
  
  def test_complement
    is_even = ->(x) { x.even? }
    is_not_even = AdvancedFunctional.complement(is_even)
    
    assert_equal true, is_even.call(2)
    assert_equal false, is_not_even.call(2)
    
    assert_equal false, is_even.call(3)
    assert_equal true, is_not_even.call(3)
  end
  
  def test_partial
    add = ->(a, b, c) { a + b + c }
    add_five = AdvancedFunctional.partial(add, 5)
    
    assert_equal 10, add_five.call(2, 3)
    
    add_five_and_two = AdvancedFunctional.partial(add, 5, 2)
    assert_equal 10, add_five_and_two.call(3)
    
    # Test with all arguments provided
    assert_equal 10, AdvancedFunctional.partial(add, 5, 2, 3).call
  end
  
  def test_juxt
    double = ->(x) { x * 2 }
    increment = ->(x) { x + 1 }
    square = ->(x) { x * x }
    
    juxtaposed = AdvancedFunctional.juxt(double, increment, square)
    
    assert_equal [10, 6, 25], juxtaposed.call(5)
    assert_equal [20, 11, 100], juxtaposed.call(10)
    
    # Test with no functions
    assert_equal [], AdvancedFunctional.juxt().call(5)
  end
  
  def test_curry
    add = ->(a, b, c) { a + b + c }
    curried_add = AdvancedFunctional.curry(add)
    
    # Test calling one argument at a time
    assert_equal 6, curried_add.call(1).call(2).call(3)
    
    # Test calling with multiple arguments
    assert_equal 6, curried_add.call(1, 2).call(3)
    assert_equal 6, curried_add.call(1).call(2, 3)
    
    # Test calling with all arguments
    assert_equal 6, curried_add.call(1, 2, 3)
    
    # Test with explicit arity
    multiply = ->(*args) { args.reduce(1, :*) }
    curried_multiply = AdvancedFunctional.curry(multiply, 3)
    
    assert_equal 24, curried_multiply.call(2).call(3).call(4)
  end
end 