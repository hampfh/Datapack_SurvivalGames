
# Enable moderators to click on signs
execute if score #game GameState matches 0..1 run scoreboard players enable @a[tag=Moderator] Trig_GameStart

###################### ChangeDiff ######################
execute if score #game GameState matches 0..1 run scoreboard players enable @a[tag=Moderator] Trig_ChangeDiff
execute if score #game GameState matches 0..1 as @a[scores={Trig_ChangeDiff=1..}] run scoreboard players add #game Difficulty 1
execute if score #game GameState matches 0..1 if score #game Difficulty matches 4.. run scoreboard players set #game Difficulty 0
execute if score #game GameState matches 0..1 as @a[scores={Trig_ChangeDiff=1..}] run tellraw @a ["",{"text":"New difficulty is ", "color":"dark_aqua"},{"score": {"name":"#game","objective":"Difficulty"}, "bold": true, "color": "dark_purple"}]
execute if score #game GameState matches 0..1 as @a[scores={Trig_ChangeDiff=1..}] store result storage minecraft:settings difficulty short 1 run scoreboard players get #game Difficulty
execute as @a[scores={Trig_ChangeDiff=1..}] run scoreboard players set @s Trig_ChangeDiff 0
###################### NoCoords ######################
execute if score #game GameState matches 0..1 run scoreboard players enable @a[tag=Moderator] Trig_NoCoords
execute if score #game GameState matches 0..1 as @a[scores={Trig_NoCoords=1..}] run scoreboard players add #game NoCoords 1
execute if score #game GameState matches 0..1 if score #game NoCoords matches 2.. run scoreboard players set #game NoCoords 0
execute if score #game GameState matches 0..1 as @a[scores={Trig_NoCoords=1..}] if score #game NoCoords matches 0 run gamerule reducedDebugInfo true
execute if score #game GameState matches 0..1 as @a[scores={Trig_NoCoords=1..}] if score #game NoCoords matches 1 run gamerule reducedDebugInfo false
execute as @a[scores={Trig_NoCoords=1..}] run scoreboard players set @s Trig_NoCoords 0
###################### DeathMsg ######################
execute if score #game GameState matches 0..1 run scoreboard players enable @a[tag=Moderator] Trig_DeathMsg
execute if score #game GameState matches 0..1 as @a[scores={Trig_DeathMsg=1..}] run scoreboard players add #game DeathMsg 1
execute if score #game GameState matches 0..1 if score #game DeathMsg matches 2.. run scoreboard players set #game DeathMsg 0
execute if score #game GameState matches 0..1 as @a[scores={Trig_DeathMsg=1..}] if score #game DeathMsg matches 0 run gamerule showDeathMessages true
execute if score #game GameState matches 0..1 as @a[scores={Trig_DeathMsg=1..}] if score #game DeathMsg matches 1 run gamerule showDeathMessages false
execute as @a[scores={Trig_DeathMsg=1..}] run scoreboard players set @s Trig_DeathMsg 0
# Reset everybodies triggers
execute as @a[scores={Trig_GameStart=1..}] run scoreboard players set @s Trig_GameStart 0