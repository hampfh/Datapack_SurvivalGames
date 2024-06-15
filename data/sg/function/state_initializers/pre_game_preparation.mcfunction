# Preparation initializer

scoreboard players set #game Sec_Timer 60
tellraw @a ["",{"text":"Game start triggered by ","color":"dark_aqua"},{"selector":"@s","bold":true,"color":"gold"}]
tellraw @a ["",{"text":"Game starts in 60 seconds","color":"dark_aqua"}]
scoreboard players set #game GameState 1

# Display
scoreboard objectives setdisplay sidebar DisplayVariable