class ConwaysLife
  class Grid
    class Cell

      attr_reader :x, :y

      def initialize( coords )
        @x, @y = [ coords[0].to_i, coords[1].to_i ]
        reset
      end

      def reset
        @neighbor_count = 0
        self
      end

      def fate
        @neighbor_count == 2 || @neighbor_count == 3
      end

      def to_sym
        @my_sym ||= coord_sym( [ x, y ] )
      end

      def neighbor_of? ( cell )
        neighbors.include? cell.to_sym
      end

      def add_neighbor
        @neighbor_count+=1
      end

      def neighbors 
        # since cells don't move the @neighbors array will never change
        @neighbors ||= neighbor_coords.map { |coords| coord_sym( coords ) }
      end

    private

      def coord_sym ( coords )
        "#{coords[0]},#{coords[1]}".to_sym
      end 

      def neighbor_coords
        [
          [ x-1, y-1 ], [ x-1, y ], [ x-1, y+1 ],
          [ x,   y-1 ],             [ x,   y+1 ],
          [ x+1, y-1 ], [ x+1, y ], [ x+1, y+1 ]
        ]
      end 

    end
  end
end
