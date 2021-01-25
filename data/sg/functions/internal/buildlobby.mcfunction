# Generate lobby
execute at @e[type=minecraft:armor_stand, name="Anchor"] run setblock ~ 201 ~ minecraft:structure_block replace
execute at @e[type=minecraft:armor_stand, name="Anchor"] run data merge block ~ 201 ~ {mode:"LOAD", name:"sg:mainlobby", posX:-12, posZ:-12}
execute at @e[type=minecraft:armor_stand, name="Anchor"] run setblock ~ 202 ~ minecraft:redstone_block replace
execute at @e[type=minecraft:armor_stand, name="Anchor"] run setblock ~ 201 ~ air replace