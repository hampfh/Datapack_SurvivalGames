scoreboard objectives add Count dummy
scoreboard players set #game Count 0
tag @a add Movable

# Apply ani-cheat effects
effect give @a[gamemode=adventure] minecraft:slowness 1000000 255 true
effect give @a[gamemode=adventure] minecraft:blindness 1000000 255 true
effect give @a[gamemode=adventure] minecraft:jump_boost 1000000 250 true

tellraw @a ["",{"text":"Commencing area pre-loading...","color":"dark_aqua"},{"text":"\n"},{"text":"This will take ","color":"dark_aqua"},{"text":"50","bold":true,"color":"gold"},{"text":" seconds","color":"dark_aqua"}]
function sg:internal/preload_area