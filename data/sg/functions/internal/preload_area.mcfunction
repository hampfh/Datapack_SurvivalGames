# Teleport around all players
function sg:internal/spread_players
scoreboard players add #game Count 1

tellraw @a ["",{"score":{"name":"#game","objective":"Count"},"bold":true,"color":"gold"},{"text":"/10","bold":true,"color":"gold"}]
execute if score #game Count matches ..9 run schedule function sg:internal/preload_area 5s

# Finish the preloading
execute if score #game Count matches 10.. run tellraw @a ["",{"text":"Loading complete!","color":"dark_aqua"}]
execute if score #game Count matches 10.. run tag @a remove Movable
execute if score #game Count matches 10.. run effect clear @a
execute if score #game Count matches 10.. run scoreboard objectives remove Count
