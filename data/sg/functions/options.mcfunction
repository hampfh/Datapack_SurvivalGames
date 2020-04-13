
# Enable moderators to click on signs
execute if score #game GameState matches 0 run scoreboard players enable @a[tag=Moderator] Trig_GameStart
execute if score #game GameState matches 0 run scoreboard players enable @a[tag=Moderator] Trig_ChangeDiff
execute if score #game GameState matches 0 run scoreboard players enable @a[tag=Moderator] Trig_NoCoords

# Check for difficuly change trigger
execute if score #game GameState matches 0 as @a[scores={Trig_ChangeDiff=1..}] run scoreboard players add #game Difficulty 1
# Reset difficulty if larger than 3
execute if score #game GameState matches 0 if score #game Difficulty matches 4.. run scoreboard players set #game Difficulty 0
execute if score #game GameState matches 0 as @a[scores={Trig_ChangeDiff=1..}] run tellraw @a ["",{"text":"New difficulty is ", "color":"dark_aqua"},{"score": {"name":"#game","objective":"Difficulty"}, "bold": true, "color": "dark_purple"}]
execute if score #game GameState matches 0 as @a[scores={Trig_ChangeDiff=1..}] run scoreboard players set @s Trig_ChangeDiff 0

# Check for no coordinate setting change
execute if score #game GameState matches 0 as @a[scores={Trig_NoCoords=1..}] run scoreboard players add #game NoCoords 1
# Reset difficulty if larger than 1
execute if score #game GameState matches 0 if score #game NoCoords matches 2.. run scoreboard players set #game NoCoords 0
execute if score #game GameState matches 0 as @a[scores={Trig_NoCoords=1..}] if score #game NoCoords matches 1 run tellraw @a ["",{"text":"Coorindates are: ","color":"dark_aqua"},{"text":"Enabled","bold":true,"color":"green"}]
execute if score #game GameState matches 0 as @a[scores={Trig_NoCoords=1..}] if score #game NoCoords matches 0 run tellraw @a ["",{"text":"Coorindates are: ","color":"dark_aqua"},{"text":"Disabled","bold":true,"color":"red"}]
# Perform gamerule change
execute if score #game GameState matches 0 as @a[scores={Trig_NoCoords=1..}] if score #game NoCoords matches 0 run gamerule reducedDebugInfo true
execute if score #game GameState matches 0 as @a[scores={Trig_NoCoords=1..}] if score #game NoCoords matches 1 run gamerule reducedDebugInfo false
# Reset
execute if score #game GameState matches 0 as @a[scores={Trig_NoCoords=1..}] run scoreboard players set @s Trig_NoCoords 0