# Game state

execute as @a[scores={Deaths=1..}, tag=InGame] run scoreboard players remove #game PlayersAlive 1
execute if score #game PlayersAlive matches 2.. as @a[scores={Deaths=1..}, tag=InGame] run tellraw @a ["",{"text":"There are now ","color":"dark_red"},{"score":{"name":"#game","objective":"PlayersAlive"},"bold":true,"color":"dark_red"},{"text":" players left in the match","color":"dark_red"}]
gamemode spectator @a[scores={Deaths=1..}]
scoreboard players set @a[scores={Deaths=1..}] Deaths 0

# Convert all non ingame players to spectators
gamemode spectator @a[tag=!InGame]
team join Spectator @a[tag=!InGame]

# Display sidebar
scoreboard players operation PlayersAlive: DisplayVariable = #game PlayersAlive

# Detect game end
execute if score #game PlayersAlive matches ..1 run function sg:internal/endgame