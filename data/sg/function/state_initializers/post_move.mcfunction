# Create new anchor

tellraw @a ["",{"text":"Re-establishing playing area...","color":"dark_aqua"}]

execute at @a[tag=Movable, limit=1] run summon armor_stand ~ 400 ~ {Invisible:1b,Invulnerable:1b,NoBasePlate:1b,NoGravity:1b,Small:1b,CustomName:"{\"text\":\"Anchor\"}"}
execute at @e[type=minecraft:armor_stand, name=Anchor] run tp @a ~ 205 ~

# Set spawn
execute at @e[type=minecraft:armor_stand, name=Anchor] run setworldspawn ~ 205 ~
# Center new border
execute at @e[type=minecraft:armor_stand, name=Anchor] run worldborder center ~ ~

effect clear @a[tag=Movable]
tag @a[tag=Movable] remove Movable

function sg:state_initializers/pre_lobby