# Moves lobby, spawn and players to another area

# Disable world border
worldborder set 30000

scoreboard players set #game GameState 3
scoreboard players set #game Sec_Timer 0

tag @r add Movable

# Move players & anchor
# Teleport random player to preload, then teleport anchor and later everbody else
tp @a[tag=Movable, limit=1] @e[type=minecraft:armor_stand, name=Anchor, limit=1]
tp @a[tag=Movable, limit=1] ~10000 400 ~
kill @e[type=minecraft:armor_stand, name=Anchor]

# Movable object
effect give @a[tag=Movable] minecraft:blindness 1000000 255 true
effect give @a[tag=Movable] minecraft:slowness 1000000 255 true
effect give @a[tag=Movable] minecraft:slow_falling 1000000 255 true
