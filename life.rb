require 'conways_life'

#state = [ [1,1], [1,2], [2,1], [2,2],  [5,7], [5,5], [5,6] ]  # Block and Blinker
state = [ [ 1, 1 ], [ 1, 2 ], [ 2, 1 ], [ 2, 2 ], [ 3 ,3 ], [ 3, 4 ], [ 4, 3 ], [ 4, 4 ] ]

life = ConwaysLife.new( state )
life.run(50)