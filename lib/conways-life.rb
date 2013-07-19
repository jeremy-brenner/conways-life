
require 'conways_life/grid'
require 'conways_life/grid/cell'

class ConwaysLife

  def initialize ( initial_state = "" )
    @grid = Grid.new parse_state( initial_state )
  end

  def tick ( iterations = 1 )
    iterations.times do |i|
      @grid.tick
    end
  end

  def state
    @grid.to_a.map { |coords| "#{coords[0]},#{coords[1]}" }.join(':')
  end

  def parse_state( state )
    state.split(":").map { |coords| coords.split(',') }
  end

end