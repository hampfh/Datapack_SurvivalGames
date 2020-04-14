tellraw @a ["",{"selector":"@a[gamemode=survival]","bold":true,"color":"gold"},{"text":" won the game","color":"dark_aqua"}]

# Add winner tag
tag @a[gamemode=survival] add Winner
tag @a remove InGame

scoreboard players set #game PlayersAlive 0
# Reset state to lobby state
scoreboard players set #game GameState 0

# Cleaer items
kill @e[type=minecraft:item]

function sg:internal/buildlobby

# Set everybodies gamemode to adventure
gamemode adventure @a[gamemode=!creative]

# Empty spectator team
team empty Spectator

# Reset worldborder
worldborder set 25 0
worldborder warning distance 0

# Clear sidebar
scoreboard players reset * DisplayVariable