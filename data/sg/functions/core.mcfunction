
# State definition
# State 0 - lobby state
# State 1 - prepare game state
# State 2 - game state

# Tag definition
# Moderator - access to executing signs
# Winner - last player that won the game

# Lobby commands
execute if score #game GameState matches 0 run gamemode adventure @a[gamemode=!creative,gamemode=!spectator]
execute if score #game GameState matches 0 run clear @a[gamemode=!creative,gamemode=!spectator]

# Set difficulty
execute if score #game GameState matches 0 if score #game Difficulty matches 0 run difficulty peaceful
execute if score #game GameState matches 0 if score #game Difficulty matches 1 run difficulty easy
execute if score #game GameState matches 0 if score #game Difficulty matches 2 run difficulty normal
execute if score #game GameState matches 0 if score #game Difficulty matches 3 run difficulty hard

# Apply effects
execute if score #game GameState matches 0 run effect give @a[gamemode=!creative,gamemode=!spectator] minecraft:resistance 1000000 255 true
execute if score #game GameState matches 0 run effect give @a[gamemode=!creative,gamemode=!spectator] minecraft:saturation 1000000 255 true
execute if score #game GameState matches 0 run effect give @a[gamemode=!creative,gamemode=!spectator,tag=Winner] minecraft:glowing 1000000 255 true

# Teleport all players out of range back to lobby
execute if score #game GameState matches 0 positioned 0 205 0 run tp @a[gamemode=!creative, gamemode=!spectator,distance=30..] 0 205 0

# Check for game start command
execute if score #game GameState matches 0 as @a[scores={Trig_GameStart=1..}] run scoreboard players set #game Timer 100
execute if score #game GameState matches 0 as @a[scores={Trig_GameStart=1..}] run tellraw @a ["",{"text":"Game start triggered by ","color":"dark_aqua"},{"selector":"@s","bold":true,"color":"gold"}]
execute if score #game GameState matches 0 as @a[scores={Trig_GameStart=1..}] run tellraw @a ["",{"text":"Game starts in 60 seconds","color":"dark_aqua"}]
execute if score #game GameState matches 0 as @a[scores={Trig_GameStart=1..}] run scoreboard players set #game GameState 1
execute as @a[scores={Trig_GameStart=1..}] run scoreboard players set @s Trig_GameStart 0

# Game preparations
execute if score #game GameState matches 1 if score #game Timer matches 600 run tellraw @a ["",{"text":"Game starts in 30 seconds","color":"dark_aqua"}]
execute if score #game GameState matches 1 if score #game Timer matches 200 run tellraw @a ["",{"text":"Game starts in 10 seconds","color":"dark_aqua"}]
execute if score #game GameState matches 1 if score #game Timer matches 100 run tellraw @a ["",{"text":"Game starts in 5 seconds","color":"dark_aqua"}]
execute if score #game GameState matches 1 if score #game Timer matches 80 run tellraw @a ["",{"text":"Game starts in 4 seconds","color":"dark_aqua"}]
execute if score #game GameState matches 1 if score #game Timer matches 60 run tellraw @a ["",{"text":"Game starts in 3 seconds","color":"dark_aqua"}]
execute if score #game GameState matches 1 if score #game Timer matches 40 run tellraw @a ["",{"text":"Game starts in 2 seconds","color":"dark_aqua"}]
execute if score #game GameState matches 1 if score #game Timer matches 20 run tellraw @a ["",{"text":"Game starts in 1 seconds","color":"dark_aqua"}]
execute if score #game GameState matches 1 if score #game Timer matches ..1 run tellraw @a ["",{"text":"Game starting!","color":"dark_aqua"}]
execute if score #game GameState matches 1 run scoreboard objectives setdisplay sidebar Timer
# Decrease timer
execute if score #game Timer matches 1.. run scoreboard players remove #game Timer 1

# Start game
execute if score #game GameState matches 1 if score #game Timer matches ..0 run function sg:internal/gamestart
# Swap gamestate when timer reaches 0
execute if score #game GameState matches 1 if score #game Timer matches ..0 run scoreboard players set #game GameState 2

# During game
execute if score #game GameState matches 2 as @a[scores={Deaths=1..}, gamemode=survival] run scoreboard players remove #game PlayersAlive 1
execute if score #game GameState matches 2 if score #game PlayersAlive matches 2.. as @a[scores={Deaths=1..}, gamemode=survival] run tellraw @a ["",{"text":"There are now ","color":"dark_red"},{"score":{"name":"#game","objective":"PlayersAlive"},"bold":true,"color":"dark_red"},{"text":" players left in the match","color":"dark_red"}]
execute if score #game GameState matches 2 run gamemode spectator @a[scores={Deaths=1..}]
execute if score #game GameState matches 2 run scoreboard players set @a[scores={Deaths=1..}] Deaths 0

# Display sidebar
function sg:internal/sidebar

# Detect game end
execute if score #game GameState matches 2 if score #game PlayersAlive matches ..1 run function sg:internal/endgame 