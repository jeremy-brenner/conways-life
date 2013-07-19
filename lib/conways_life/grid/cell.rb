class ConwaysLife
  class Grid
    class Cell
      def initialize( coords )
        @x, @y = [ coords[0].to_i, coords[1].to_i ]
        @neighbor_count = 0
      end
      def reset
        @neighbor_count = 0
        self
      end
      def fate
        @neighbor_count == 2 || @neighbor_count == 3
      end
      def to_sym
        "#{x}x#{y}".to_sym
      end
      def neighbor_of? ( cell )
        neighbors.include? [ cell.x, cell.y ]
      end
      def add_neighbor
        @neighbor_count+=1
      end
      def neighbors
        @neighbors ||= 
          [
            [ x-1, y-1 ], [ x-1, y ], [ x-1, y+1 ],
            [ x,   y-1 ],             [ x,   y+1 ],
            [ x+1, y-1 ], [ x+1, y ], [ x+1, y+1 ]
          ]
      end 
      def x
        @x
      end
      def y
        @y
      end
    end
  end
end
