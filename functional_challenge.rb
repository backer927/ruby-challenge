#!/usr/bin/env ruby

# Solution to the Functional Programming Challenge
# This file should be git-ignored in the actual challenge repository

module FunctionalChallenge
  def self.my_map(array, &block)
    result = []
    array.each { |item| result << block.call(item) }
    result
  end

  def self.my_filter(array, &block)
    result = []
    array.each { |item| result << item if block.call(item) }
    result
  end

  def self.my_reduce(array, initial = nil, &block)
    return initial if array.empty?
    
    if initial.nil?
      acc = array[0]
      rest = array[1..-1]
    else
      acc = initial
      rest = array
    end
    
    rest.each { |item| acc = block.call(acc, item) }
    acc
  end

  def self.compose(*funcs)
    ->(x) {
      funcs.reverse.reduce(x) { |acc, func| func.call(acc) }
    }
  end

  def self.pipe(*funcs)
    ->(x) {
      funcs.reduce(x) { |acc, func| func.call(acc) }
    }
  end

  def self.memoize(func = nil, &block)
    func ||= block
    cache = {}
    
    ->(arg, *args) {
      key = [arg, *args]
      if cache.key?(key)
        cache[key]
      else
        cache[key] = func.call(arg, *args)
      end
    }
  end

  def self.curry(func, arity = nil)
    arity ||= func.arity
    
    lambda do |*args|
      if args.length >= arity
        func.call(*args.take(arity))
      else
        remaining = arity - args.length
        lambda do |*more_args|
          curry(func, remaining).call(*args, *more_args)
        end
      end
    end
  end
end 