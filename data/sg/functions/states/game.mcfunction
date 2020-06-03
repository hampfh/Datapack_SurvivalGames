# Game state

gamemode spectator @a[scores={Deaths=1..}]

tag @a[scores={Deaths=1..}, tag=InGame] remove InGame
scoreboard players set @a[scores={Deaths=1..}] Deaths 0

# Check active players
scoreboard players set #game PlayersAlive 0
execute as @a[tag=InGame] run scoreboard players add #game PlayersAlive 1
# Check active teams
execute if score #game Teams matches 1 run scoreboard players set #game TeamsAlive 0
execute if score #game Teams matches 1 run function sg:internal/teams/update_teams_alive

# Show death message
execute if score #game PlayersAlive matches 2.. as @a[scores={Deaths=1..}, tag=InGame] run tellraw @a ["",{"text":"There are now ","color":"dark_red"},{"score":{"name":"#game","objective":"PlayersAlive"},"bold":true,"color":"dark_red"},{"text":" players left in the match","color":"dark_red"}]

# Convert all non ingame players to spectators
gamemode spectator @a[tag=!InGame]

# Increase timer
execute if score #game Timer matches 20.. run scoreboard players add #game Sec_Timer 1
execute if score #game Sec_Timer matches 60.. run scoreboard players add #game Min_Timer 1
execute if score #game Sec_Timer matches 0..45 run scoreboard objectives setdisplay sidebar DisplayVariable
execute if score #game Sec_Timer matches 45.. run scoreboard objectives setdisplay sidebar Kills
execute if score #game Sec_Timer matches 60.. run scoreboard players set #game Sec_Timer 0

# Display sidebar
scoreboard players operation PlayersAlive: DisplayVariable = #game PlayersAlive
execute if score #game Teams matches 1 run scoreboard players operation TeamsAlive: DisplayVariable = #game TeamsAlive
scoreboard players operation Minutes: DisplayVariable = #game Min_Timer
scoreboard players operation Border: DisplayVariable = #game BorderDistance

# Handle shield clearing if AllowShield is zeroed
execute if score #game AllowShield matches 0 run function sg:internal/clear_shields

# Detect end game & start end game
execute if score #game Min_Timer >= #game GameMaxTime if score #game GameState matches 2 run function sg:state_initializers/pre_end_game

# Detect game end
execute if score #game Teams matches 0 if score #game PlayersAlive matches ..1 run function sg:state_initializers/post_game
execute if score #game Teams matches 1 if score #game TeamsAlive matches ..1 run function sg:state_initializers/post_game