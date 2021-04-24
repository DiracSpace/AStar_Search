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

# puts "\n"

# dungeon2 = File.open("laberinto2.txt", "r").read

# graph2 = Graph.new(dungeon2)

# astar2 = ASTAR.new(graph2.start, graph2.stop)

# path2  = astar2.search

# puts graph.to_s(path2)

exit 0
