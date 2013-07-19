
require 'conways_life/grid'
require 'conways_life/grid/cell'

class ConwaysLife
  def initialize ( initial_state = [] )
    @grid = Grid.new initial_state 
  end
  def tick ( iterations = 1 )
    iterations.times do |i|
       @grid.tick
    end
  end
  def state
    "#{@grid.iteration}: #{ @grid.to_a }\n"
  end
end