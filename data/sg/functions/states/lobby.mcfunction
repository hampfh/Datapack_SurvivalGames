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
execute at @e[type=minecraft:armor_stand, name=Anchor] positioned ~ 205 ~ run tp @a[gamemode=!creative, gamemode=!spectator,distance=30.., tag=!Movable] ~ 205 ~

# Check for game start command
execute as @a[scores={Trig_GameStart=1..}] run function sg:state_initializers/pre_game_preparation

# Update signs 
function sg:internal/update_signs