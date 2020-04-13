
tellraw @a ["",{"selector":"@a[gamemode=survival]","bold":true,"color":"gold"},{"text":" won the game","color":"dark_aqua"}]

scoreboard players set #game PlayersAlive 0
# Reset state to lobby state
scoreboard players set #game GameState 0

# Cleaer items
kill @e[type=minecraft:item]

function sg:internal/buildlobby

# Set everybodies gamemode to adventure
gamemode adventure @a[gamemode=!creative]