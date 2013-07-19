
require 'conways_life/grid'
require 'conways_life/grid/cell'

class ConwaysLife
  def initialize ( initial_state = [] )
    @grid = Grid.new initial_state 
  end
  def run ( iterations )
    iterations.times do |i|
       @grid.tick
       print "#{i+1}: #{ @grid.to_a }\n"
    end
  end
end