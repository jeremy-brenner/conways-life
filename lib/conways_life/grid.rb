class ConwaysLife
  class Grid
    def initialize( initial_state )
      build_grid initial_state
    end

    def tick
      find_neighbors
      tick_cells
    end

    # builds the grid as an aray using Array.combination to find neighbors
    def build_grid( state )
      @grid = {}
      state.each do |coords| 
        c = Cell.new(coords)
        @grid[c.to_sym] = c
      end
    end

    def find_neighbors
      @grid.values.combination(2).each do |cells|
        if cells[0].neighbor_of? cells[1]
          cells[0].add_neighbor
          cells[1].add_neighbor
        end
      end
    end

    def tick_cells
      new_grid = {}
      baby_cells = Hash.new(0)
      @grid.each do |key,cell|
        cell.neighbors.each do |baby|
          baby_cells[ "#{baby[0]}x#{baby[1]}".to_sym ] += 1
        end
        if cell.fate 
          new_grid[cell.to_sym] = cell.reset
        end
      end

      baby_cells.each do |k,v|
        if v == 3
          new_grid[k] = Cell.new( k.to_s.split('x') )
        end
      end
      @grid = new_grid
    end

    def to_a
      @grid.keys
    end

  end
end