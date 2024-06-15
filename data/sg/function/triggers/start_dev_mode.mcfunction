# Generate lobby
execute at @e[type=minecraft:armor_stand, name="Anchor"] run setblock ~ 199 ~ minecraft:structure_block replace
execute at @e[type=minecraft:armor_stand, name="Anchor"] run data merge block ~ 199 ~ {mode:"LOAD", name:"sg:dev_structure", posX:0, posZ:0}
execute at @e[type=minecraft:armor_stand, name="Anchor"] run setblock ~ 199 ~1 minecraft:redstone_block replace
execute at @e[type=minecraft:armor_stand, name="Anchor"] run setblock ~ 199 ~ air replace
execute at @e[type=minecraft:armor_stand, name="Anchor"] run setblock ~ 199 ~1 air replace