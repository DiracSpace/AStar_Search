#!/usr/bin/env ruby

class Node
  attr_accessor :g, :h, :prev
  attr_reader :r, :c, :near

  def initialize(r, c)
    [r, c].each do |input|
      raise ArgumentError,
        "input must be a Numeric.\n" + 
        "Received a #{input.class}" unless input.is_a? Numeric
    end
    @r = r
    @c = c
    
    @g = 0.0
    @h = 0.0
    
    @prev = nil
    @near = []
  end

  def f
    self.g + self.h
  end
  
  def distance(n)
    raise ArgumentError,
      "A Node must be given as input.\n" +
      "Received a #{n.class}" unless n.is_a? Node
    return (
      (@r - n.r) ** 2 +
      (@c - n.c) ** 2
    ) ** (0.5)
  end

  def insert(n)
    raise ArgumentError,
      "A Node must be given as input.\n" +
      "Received a #{n.class}" unless n.is_a? Node
    @near << n
  end
end