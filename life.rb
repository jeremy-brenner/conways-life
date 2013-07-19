require 'conways_life'

# initial_state = "1,1:1,2:2,1:2,2:5,7:5,5:5,6"  # Block and Blinker
 initial_state = "1,1:1,2:2,1:2,2:3,3:3,4:4,3:4,4" # Beacon
# initial_state = "3,1:3,2:3,3:2,3:1,2" # Glider

life = ConwaysLife.new( initial_state )

1000.times do
  life.tick(1)
  print life.state
end