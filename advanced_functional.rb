#!/usr/bin/env ruby

module AdvancedFunctional
  # Implement a function that takes a function and returns a memoized version
  # The memoized function should cache results for the same arguments
  def self.memoize(&block)
    # Your implementation here
  end
  
  # Implement a function that takes multiple functions and returns their composition
  # compose(f, g, h).(x) should be equivalent to f(g(h(x)))
  def self.compose(*functions)
    # Your implementation here
  end
  
  # Implement a function that takes multiple functions and returns their pipeline
  # pipe(f, g, h).(x) should be equivalent to h(g(f(x)))
  def self.pipe(*functions)
    # Your implementation here
  end
  
  # Implement a function that takes a predicate and returns its negation
  # complement(even?).(3) should return true
  def self.complement(predicate)
    # Your implementation here
  end
  
  # Implement a function that partially applies arguments to a function
  # partial(add, 1).(2) should return 3 if add = ->(a, b) { a + b }
  def self.partial(func, *args)
    # Your implementation here
  end
  
  # Implement a function that returns a function that applies the original function to each element of an array
  # map_fn = juxt(->(x) { x * 2 }, ->(x) { x + 1 })
  # map_fn.(5) should return [10, 6]
  def self.juxt(*functions)
    # Your implementation here
  end
  
  # Implement a function that takes a function with multiple arguments and returns a curried version
  # add = ->(a, b, c) { a + b + c }
  # curry(add).(1).(2).(3) should return 6
  def self.curry(func, arity = nil)
    # Your implementation here
  end
end 