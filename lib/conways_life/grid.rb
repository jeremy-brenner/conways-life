class ConwaysLife
  class Grid

    attr_reader :iteration

    def initialize( initial_state )
      build_grid initial_state
    end

    def tick
      find_neighbors
      rebuild_grid
      @iteration+=1
    end

    def build_grid( state )
      @iteration = 0
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

    def rebuild_grid

      new_grid = {}
      baby_cells = Hash.new(0)

      @grid.each do |key,cell|

        #touch possible babies
        cell.neighbors.each do |baby|
          baby_cells[ baby ] += 1
        end

        # reset and copy cell to new grid if it lives
        if cell.fate 
          new_grid[cell.to_sym] = cell.reset
        end

      end

      baby_cells.each do |location,neighbor_count|
        new_grid[location] ||= Cell.new( location.to_s.split(',') ) if neighbor_count == 3
      end

      @grid = new_grid

    end

    def to_a
      @grid.keys
    end

  end
end