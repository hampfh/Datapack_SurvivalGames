tellraw @a [{"text":"Sudden death", "bold":true, "color":"gold"}]
tellraw @a [{"text":"Fight begins in 5 seconds", "color": "gold"}]

# Set countdown
scoreboard players set #sudden_death Sec_Timer 5

# Reset warning distance
worldborder warning distance 0

# Create arena
execute at @e[type=minecraft:armor_stand,name=Anchor] positioned ~ 255 ~ run worldborder set 20 0
execute at @e[type=minecraft:armor_stand,name=Anchor] positioned ~ 255 ~ run worldborder center ~ ~
execute at @e[type=minecraft:armor_stand,name=Anchor] positioned ~ 255 ~ run fill ~15 ~-10 ~15 ~-15 ~-10 ~-15 minecraft:barrier
execute at @e[type=minecraft:armor_stand,name=Anchor] positioned ~ 255 ~ run fill ~9 ~-11 ~9 ~-10 ~-11 ~-10 minecraft:grass_block

# Give effects to players
effect give @a[tag=InGame] minecraft:blindness infinite 255 true
effect give @a[tag=InGame] minecraft:jump_boost infinite 250 true
effect give @a[tag=InGame] minecraft:mining_fatigue infinite 250 true
effect give @a[tag=InGame] minecraft:weakness infinite 250 true
effect give @a[tag=InGame] minecraft:slowness infinite 250 true
effect give @a[tag=InGame] minecraft:saturation infinite 250 true

# Teleport players to arena
execute at @e[type=minecraft:armor_stand,name=Anchor] positioned ~ 246 ~ run spreadplayers ~ ~ 4 9 false @a[tag=InGame]
execute as @a at @s run tp @s[tag=InGame] ~ ~ ~ facing ~ 0 ~
# Teleport spectators to arena
execute at @e[type=minecraft:armor_stand,name=Anchor] run tp @a[gamemode=spectator] ~ 256 ~ facing ~ 0 ~

# Set game state to sudden death
scoreboard players set #game GameState 4