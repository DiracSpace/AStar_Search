#!/usr/bin/env ruby

class ASTAR

  def initialize(start, stop)
    [start, stop].each do |e|
      raise ArgumentError, 
        "Required a Node as input." +
        "Received a #{e.class}" unless e.is_a? Node
    end
    
    @start = start
    @stop  = stop
    @openset = [@start]
    @closedset = []
    @start.g = 0
    @start.h = @start.distance(@stop)
  end
  
  def search
    while @openset.size > 0
      x = openset_min_f()
      if x == @stop
        return reconstruct_path(x)
      end
      
      @openset -= [x]
      @closedset += [x]
      
      x.near.each do |y|
        next if @closedset.include?(y)

        g_score = x.g + x.distance(y)
        
        if not @openset.include?(y)
          @openset += [y]
          improving = true

        elsif g_score < y.g
          improving = true

        else
          improving = false

        end
        
        if improving
          y.prev = x
          y.g = g_score
          y.h = y.distance(@stop)
        end
      end # for
      
    end # while
    
    return []
  end
  
  private
  
  def openset_min_f
    ret = @openset[0]
    for i in 1...@openset.size
      ret = @openset[i] if ret.f > @openset[i].f
    end
    return ret
  end # openset_min_f
  
  def reconstruct_path(curr)
    return ( curr.prev ? reconstruct_path(curr.prev) + [curr] : [] )
  end # reconstruct_path

end # ASTAR

