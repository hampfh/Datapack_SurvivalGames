
# Send the user a tellraw that shields were disabled
execute as @a[nbt={Inventory:[{id:"minecraft:shield"}]}] run tellraw @s ["",{"text":"Shields are disabled by the host.","bold":true,"underlined":true,"color":"gold"}]

# Give back crafting items
# We'll just give back oak planks for now
execute as @a[nbt={Inventory:[{id:"minecraft:shield"}]}] run give @s minecraft:oak_planks 6
execute as @a[nbt={Inventory:[{id:"minecraft:shield"}]}] run give @s minecraft:iron_ingot 1

# Remove shield
# ONLY remove 1 at a time, so the right amount of materials are given back. (Team situations may craft more than one!)
execute as @a[nbt={Inventory:[{id:"minecraft:shield"}]}] run clear @s minecraft:shield 1