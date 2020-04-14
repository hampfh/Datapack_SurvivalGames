# Game state

execute as @a[scores={Deaths=1..}, tag=InGame] run scoreboard players remove #game PlayersAlive 1
execute if score #game PlayersAlive matches 2.. as @a[scores={Deaths=1..}, tag=InGame] run tellraw @a ["",{"text":"There are now ","color":"dark_red"},{"score":{"name":"#game","objective":"PlayersAlive"},"bold":true,"color":"dark_red"},{"text":" players left in the match","color":"dark_red"}]
gamemode spectator @a[scores={Deaths=1..}]
tag @a[scores={Deaths=1..}, tag=InGame] remove InGame
scoreboard players set @a[scores={Deaths=1..}] Deaths 0

# Convert all non ingame players to spectators
gamemode spectator @a[tag=!InGame]
team join Spectator @a[tag=!InGame]

# Increase timer
execute if score #game Timer matches 20.. run scoreboard players add #game Sec_Timer 1
execute if score #game Sec_Timer matches 60.. run scoreboard players add #game Min_Timer 1
execute if score #game Sec_Timer matches 60.. run scoreboard players set #game Sec_Timer 0

# Display sidebar
scoreboard players operation PlayersAlive: DisplayVariable = #game PlayersAlive
scoreboard players operation Minutes: DisplayVariable = #game Min_Timer

# Detect game end
execute if score #game PlayersAlive matches ..1 run function sg:state_initializers/post_game