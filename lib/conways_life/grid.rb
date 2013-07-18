class ConwaysLife
  class Grid
    def initialize( initial_state, lookup_style = :array )
      if lookup_style == :array
        build_grid_array initial_state
        find_array_neighbors 
      else
        build_grid_hash initial_state
      end
    end

    # builds the grid as an aray using Array.combination to find neighbors
    def build_grid_array( state )
      @grid = []
      state.each do |coords| 
        @grid << Cell.new(coords)
      end
    end

    def find_array_neighbors
      @grid.combination(2).each do |cells|
        if cells[0].neighbor_of? cells[1]
          cells[0].add_neighbor
          cells[1].add_neighbor
        end
      end
    end

    # builds the grid as a hash keyed by symbols using hash lookup to find neighbors
    def build_grid_hash( state )
      @grid_hash = {}
      state.each do |coords|
        c = Cell.new(coords)
        @grid_hash[c.to_sym] = c
      end
    end

  end
end