# Display win message
execute if score #game Teams matches 0 run tellraw @a ["",{"selector":"@a[tag=InGame]","bold":true,"color":"gold"},{"text":" won the game","color":"dark_aqua"}]
execute if score #game Teams matches 1 run function sg:internal/teams/team_win_message

# Display game time
tellraw @a ["",{"text":"The game took ","color":"dark_aqua"},{"score":{"name":"#game","objective":"Min_Timer"},"bold":true,"color":"dark_aqua"},{"text":" minutes and ","color":"dark_aqua"},{"score":{"name":"#game","objective":"Sec_Timer"},"bold":true,"color":"dark_aqua"},{"text":" seconds","color":"dark_aqua"}]

# Add winner tag
execute if score #game Teams matches 0 run tag @a[tag=InGame] add Winner
execute if score #game Teams matches 0 run scoreboard players add @a[tag=InGame] Wins 1
execute if score #game Teams matches 1 run function sg:internal/teams/detect_team_win
tag @a remove InGame

# Call post sudden death
execute if score #game GameState matches 4 run function sg:state_initializers/post_sudden_death

scoreboard players set #game PlayersAlive 0
scoreboard players set #game TeamsAlive 0
# Reset state to lobby state
scoreboard players set #game GameState 0

# Clear scoreboard
scoreboard objectives setdisplay sidebar

# Cleaer items
kill @e[type=minecraft:item]

# Empty teams
effect clear @a
team leave @a

# Reset worldborder
worldborder set 5000 0
worldborder warning distance 0

# Clear sidebar
scoreboard players reset * DisplayVariable

function sg:state_initializers/pre_lobby