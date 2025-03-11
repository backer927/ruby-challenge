# Ruby Functional Programming Challenges

This repository contains two coding challenges that test your understanding of functional programming concepts in Ruby:

1. Basic Functional Programming Challenge
2. Advanced Functional Programming Challenge

## Basic Challenge Description

In this challenge, you'll implement several methods in the `FunctionalChallenge` module:

1. Basic array operations without using built-in methods:
   - `my_map`: Similar to Ruby's `Array#map`
   - `my_filter`: Similar to Ruby's `Array#select`
   - `my_reduce`: Similar to Ruby's `Array#reduce`/`inject`

2. Higher-order function operations:
   - `compose`: Function composition (right to left)
   - `pipe`: Function piping (left to right)
   - `memoize`: Function memoization
   - `curry`: Function currying

## Advanced Challenge Description

After completing the basic challenge, you can move on to the advanced challenge. In this challenge, you'll implement several methods in the `AdvancedFunctional` module:

1. Higher-order function operations:
   - `memoize`: Function memoization with support for multiple arguments
   - `compose`: Function composition (right to left)
   - `pipe`: Function piping (left to right)
   - `complement`: Function negation
   - `partial`: Partial function application
   - `juxt`: Function juxtaposition
   - `curry`: Function currying with support for variable arity

## Getting Started

1. Clone this repository
2. Implement the required methods in `functional_challenge.rb` for the basic challenge
3. Run the tests to verify your implementation:
   ```bash
   ruby functional_challenge_test.rb
   ```
4. After completing the basic challenge, implement the required methods in `advanced_functional.rb`
5. Run the tests to verify your implementation:
   ```bash
   ruby advanced_functional_test.rb
   ```

## Time Limit

You should aim to complete:
- Basic challenge in 20-30 minutes
- Advanced challenge in 30-40 minutes

## Requirements

- Ruby 2.5 or higher
- Do not use the built-in methods that you're implementing (e.g., don't use `map` when implementing `my_map`)
- Your implementation should pass all the tests

## Tips

- The curry function is the most challenging - take your time with it
- For memoize, think about how to handle multiple arguments
- Remember that compose and pipe work in opposite directions

## Examples

### Basic Challenge

```ruby
# Using my_map
FunctionalChallenge.my_map([1, 2, 3]) { |x| x * 2 }
# => [2, 4, 6]

# Using compose
add_one = ->(x) { x + 1 }
multiply_by_two = ->(x) { x * 2 }
composed = FunctionalChallenge.compose(add_one, multiply_by_two)
composed.call(5)  # => 11 (5 * 2 + 1)

# Using curry
add = ->(a, b, c) { a + b + c }
curried_add = FunctionalChallenge.curry(add)
curried_add.call(1).call(2).call(3)  # => 6
```

### Advanced Challenge

```ruby
# Using memoize
expensive_function = lambda do |x|
  puts "Computing #{x}..."
  x * 2
end

memoized = AdvancedFunctional.memoize(&expensive_function)
memoized.call(5)  # Outputs: Computing 5... and returns 10
memoized.call(5)  # No output, returns 10 from cache

# Using juxt
double = ->(x) { x * 2 }
increment = ->(x) { x + 1 }
square = ->(x) { x * x }
juxtaposed = AdvancedFunctional.juxt(double, increment, square)
juxtaposed.call(5)  # => [10, 6, 25]

# Using complement
is_even = ->(x) { x.even? }
is_odd = AdvancedFunctional.complement(is_even)
is_odd.call(3)  # => true
```

Good luck! 