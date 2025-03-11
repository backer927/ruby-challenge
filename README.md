# Ruby Functional Programming Challenge

This coding challenge tests your understanding of functional programming concepts in Ruby. You'll implement several functions that manipulate arrays and functions, similar to those found in functional programming languages.

## Challenge Description

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

## Getting Started

1. Clone this repository
2. Implement the required methods in `functional_challenge.rb`
3. Run the tests to verify your implementation

```bash
ruby functional_challenge_test.rb
```

## Time Limit

You should aim to complete this challenge in 20-30 minutes.

## Requirements

- Ruby 2.5 or higher
- Do not use the built-in methods that you're implementing (e.g., don't use `map` when implementing `my_map`)
- Your implementation should pass all the tests

## Tips

- The curry function is the most challenging - take your time with it
- For memoize, think about how to handle recursive functions
- Remember that compose and pipe work in opposite directions

## Example

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

Good luck! 