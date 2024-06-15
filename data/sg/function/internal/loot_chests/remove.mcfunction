# Remove chest if it exists
execute at @e[type=minecraft:armor_stand, name="LOOT_CHEST"] run setblock ~ ~ ~ minecraft:air
# Delete all loot chest markers
execute as @e[type=minecraft:armor_stand, name="LOOT_CHEST"] run kill @s