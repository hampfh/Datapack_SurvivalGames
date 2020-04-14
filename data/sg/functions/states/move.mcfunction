# Move state is state for moving the whole playing area 10000 blocks on the x axis

# Wait 5 seconds then perform everything

execute if score #game Timer matches 20.. run scoreboard players add #game Sec_Timer 1
# Spawn armor stand after 5 seconds
execute if score #game Sec_Timer matches 5.. run function sg:state_initializers/post_move