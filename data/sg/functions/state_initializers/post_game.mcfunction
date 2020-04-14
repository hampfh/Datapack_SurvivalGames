tellraw @a ["",{"selector":"@a[tag=InGame]","bold":true,"color":"gold"},{"text":" won the game","color":"dark_aqua"}]

# Add winner tag
tag @a[tag=InGame] add Winner

scoreboard players set #game PlayersAlive 0
# Reset state to lobby state
scoreboard players set #game GameState 0

# Cleaer items
kill @e[type=minecraft:item]

# Empty spectator team
team empty Spectator

# Reset worldborder
worldborder set 25 0
worldborder warning distance 0

# Clear sidebar
scoreboard players reset * DisplayVariable

function sg:state_initializers/pre_lobby