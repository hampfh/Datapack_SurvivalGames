# This function will update all signs to match their coresponding scoreboard
# All commands are executed from the perspective of the anchor
execute at @e[type=minecraft:armor_stand,name=Anchor] positioned ~ ~-196 ~-7 if score #game NoCoords matches 0 run data merge block ~-2 ~1 ~ {Text3:'{"text":"[Disabled]","color":"red"}'}
execute at @e[type=minecraft:armor_stand,name=Anchor] positioned ~ ~-196 ~-7 if score #game NoCoords matches 1 run data merge block ~-2 ~1 ~ {Text3:'{"text":"[Enabled]","color":"green"}'}
execute at @e[type=minecraft:armor_stand,name=Anchor] positioned ~ ~-196 ~-7 if score #game FallDamage matches 0 run data merge block ~-1 ~1 ~ {Text3:'{"text":"[Disabled]","color":"red"}'}
execute at @e[type=minecraft:armor_stand,name=Anchor] positioned ~ ~-196 ~-7 if score #game FallDamage matches 1 run data merge block ~-1 ~1 ~ {Text3:'{"text":"[Enabled]","color":"green"}'}
execute at @e[type=minecraft:armor_stand,name=Anchor] positioned ~ ~-196 ~-7 if score #game ShowPrgress matches 0 run data merge block ~-2 ~0 ~ {Text3:'{"text":"[Disabled]","color":"red"}'}
execute at @e[type=minecraft:armor_stand,name=Anchor] positioned ~ ~-196 ~-7 if score #game ShowPrgress matches 1 run data merge block ~-2 ~0 ~ {Text3:'{"text":"[Enabled]","color":"green"}'}
execute at @e[type=minecraft:armor_stand,name=Anchor] positioned ~ ~-196 ~-7 if score #game DeathMsg matches 0 run data merge block ~-1 ~0 ~ {Text3:'{"text":"[Disabled]","color":"red"}'}
execute at @e[type=minecraft:armor_stand,name=Anchor] positioned ~ ~-196 ~-7 if score #game DeathMsg matches 1 run data merge block ~-1 ~0 ~ {Text3:'{"text":"[Enabled]","color":"green"}'}
execute at @e[type=minecraft:armor_stand,name=Anchor] positioned ~ ~-196 ~-7 if score #game Teams matches 0 run data merge block ~1 ~1 ~ {Text3:'{"text":"[Disabled]","color":"red"}'}
execute at @e[type=minecraft:armor_stand,name=Anchor] positioned ~ ~-196 ~-7 if score #game Teams matches 1 run data merge block ~1 ~1 ~ {Text3:'{"text":"[Enabled]","color":"green"}'}
execute at @e[type=minecraft:armor_stand,name=Anchor] positioned ~ ~-196 ~-7 if score #game RandTeams matches 0 run data merge block ~2 ~1 ~ {Text3:'{"text":"[Disabled]","color":"red"}'}
execute at @e[type=minecraft:armor_stand,name=Anchor] positioned ~ ~-196 ~-7 if score #game RandTeams matches 1 run data merge block ~2 ~1 ~ {Text3:'{"text":"[Enabled]","color":"green"}'}
execute at @e[type=minecraft:armor_stand,name=Anchor] positioned ~ ~-196 ~-7 if score #game UHCMode matches 0 run data merge block ~1 ~0 ~ {Text3:'{"text":"[Disabled]","color":"red"}'}
execute at @e[type=minecraft:armor_stand,name=Anchor] positioned ~ ~-196 ~-7 if score #game UHCMode matches 1 run data merge block ~1 ~0 ~ {Text3:'{"text":"[Enabled]","color":"green"}'}
execute at @e[type=minecraft:armor_stand,name=Anchor] positioned ~ ~-196 ~-7 if score #game DoInsomnia matches 0 run data merge block ~2 ~0 ~ {Text3:'{"text":"[Disabled]","color":"red"}'}
execute at @e[type=minecraft:armor_stand,name=Anchor] positioned ~ ~-196 ~-7 if score #game DoInsomnia matches 1 run data merge block ~2 ~0 ~ {Text3:'{"text":"[Enabled]","color":"green"}'}
# Map size sign
execute at @e[type=minecraft:armor_stand,name=Anchor] positioned ~ ~-196 ~-7 run data merge block ~-1 ~-1 ~ {"Text3":'[{"score":{"name":"#game", "objective":"MapSize"}, "color": "dark_purple"},{"text":" blocks", "color":"dark_purple"}]'}
# GameMaxTime sign
execute at @e[type=minecraft:armor_stand,name=Anchor] positioned ~ ~-196 ~-7 run data merge block ~-2 ~-1 ~ {"Text3":'[{"score":{"name":"#game", "objective":"GameMaxTime"}, "color": "dark_purple"},{"text":" min", "color":"dark_purple"}]'}