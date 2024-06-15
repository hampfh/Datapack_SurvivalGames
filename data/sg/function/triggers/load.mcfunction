# Introduce variable to keep track if the pack has been instantiated or not

# Only instantiate if there is no anchor (game is not initialized)
execute unless entity @e[type=minecraft:armor_stand,name=Anchor] run scoreboard objectives add PackInstantiated dummy
execute unless entity @e[type=minecraft:armor_stand,name=Anchor] run scoreboard players set #game PackInstantiated 0

execute as @e[type=minecraft:armor_stand,name=Anchor] run scoreboard players set #game PackInstantiated 2