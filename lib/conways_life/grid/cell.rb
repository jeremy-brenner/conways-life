class ConwaysLife
  class Grid
    class Cell
      def initialize( coords )
        @coords = coords
        @neighbors = 0
      end
      def to_sym
        "#{x}x#{y}".to_sym
      end
      def neighbor_of? ( cell )
        return false if cell.x == x && cell.y == y
        return x_neighbor?( cell ) && y_neighbor?( cell )
      end
      def x_neighbor? ( cell )
        [ x - 1, x, x + 1 ].include? cell.x
      end
      def y_neighbor? ( cell )
        [ y - 1, y, y + 1 ].include? cell.y
      end
      def add_neighbor
        @neighbors+=1
      end
      def x
        @coords[0]
      end
      def y
        @coords[1]
      end
    end
  end
end
