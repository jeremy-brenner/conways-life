
require 'conways_life/grid'
require 'conways_life/grid/cell'

class ConwaysLife
  def initialize ( initial_state = [] )
    @state = Grid.new initial_state 
    p @state
  end
end