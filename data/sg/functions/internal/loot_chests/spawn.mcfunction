# Make every player create an armor stand
execute at @a[tag=InGame] run summon armor_stand ~ ~-0.5 ~ {Invisible:1b,Invulnerable:1b,Marker:1b,CustomName:'{"text":"LOOT_CHEST"}'}
execute at @a[tag=InGame] run summon armor_stand ~ ~-0.5 ~ {Invisible:1b,Invulnerable:1b,Marker:1b,CustomName:'{"text":"LOOT_CHEST"}'}
execute at @a[tag=InGame] run summon armor_stand ~ ~-0.5 ~ {Invisible:1b,Invulnerable:1b,Marker:1b,CustomName:'{"text":"LOOT_CHEST"}'}
execute at @a[tag=InGame] run summon armor_stand ~ ~-0.5 ~ {Invisible:1b,Invulnerable:1b,Marker:1b,CustomName:'{"text":"LOOT_CHEST"}'}

# Every player will spread it's own armor stands
execute at @a[tag=InGame] run spreadplayers ~ ~ 50 300 false @e[type=minecraft:armor_stand, name="LOOT_CHEST", distance=..50, limit=1]
# Add force loaders to all loot chests
execute at @e[type=minecraft:armor_stand, name="LOOT_CHEST"] run forceload add ~ ~ ~ ~

# Generate loot 2 seconds after start
schedule function sg:internal/loot_chests/generate_loot 2s