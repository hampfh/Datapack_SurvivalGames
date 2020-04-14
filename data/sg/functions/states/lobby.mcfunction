# Lobby state

# Prepare players
gamemode adventure @a[gamemode=!creative,gamemode=!spectator]
clear @a[gamemode=!creative,gamemode=!spectator]

# Set difficulty
execute if score #game Difficulty matches 0 run difficulty peaceful
execute if score #game Difficulty matches 1 run difficulty easy
execute if score #game Difficulty matches 2 run difficulty normal
execute if score #game Difficulty matches 3 run difficulty hard

# Apply effects
effect give @a[gamemode=!creative,gamemode=!spectator] minecraft:resistance 1000000 255 true
effect give @a[gamemode=!creative,gamemode=!spectator] minecraft:saturation 1000000 255 true
effect give @a[gamemode=!creative,gamemode=!spectator,tag=Winner] minecraft:glowing 1000000 255 true

# Teleport all players out of range back to lobby
execute positioned 0 205 0 run tp @a[gamemode=!creative, gamemode=!spectator,distance=30..] 0 205 0

# Check for game start command
execute as @a[scores={Trig_GameStart=1..}] run scoreboard players set #game Sec_Timer 60
execute as @a[scores={Trig_GameStart=1..}] run tellraw @a ["",{"text":"Game start triggered by ","color":"dark_aqua"},{"selector":"@s","bold":true,"color":"gold"}]
execute as @a[scores={Trig_GameStart=1..}] run tellraw @a ["",{"text":"Game starts in 60 seconds","color":"dark_aqua"}]
execute as @a[scores={Trig_GameStart=1..}] run scoreboard players set #game GameState 1
