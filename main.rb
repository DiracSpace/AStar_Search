#!/usr/bin/env ruby

%w|./utils/node.rb ./utils/graph.rb ./utils/astar.rb|.each do |l|
  raise LoadError,
    "cannot load required file #{l}" unless load l
end

dungeon = File.open("laberintos/laberinto1.txt", "r").read
require 'pry'

graph = Graph.new(dungeon)

astar = ASTAR.new(graph.start, graph.stop)

path  = astar.search

puts graph.to_s(path)

exit 0
