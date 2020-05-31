# Introduce variable to keep track if the pack has been instantiated or not
scoreboard objectives add PackInstantiated dummy
scoreboard players set #game PackInstantiated 0
execute as @e[type=minecraft:armor_stand,name=Anchor] run scoreboard players set #game PackInstantiated 2