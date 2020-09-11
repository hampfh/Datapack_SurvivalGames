# Generate chests
execute if score #game LootChests matches 1.. at @e[type=minecraft:armor_stand, name="LOOT_CHEST"] run setblock ~ ~ ~ barrel[facing=up]{LootTable:"sg:tier_one",CustomName:'{"text":"Tier 1 crate","color":"yellow","bold":true,"italic":true}'} replace
#execute if score #game LootChests matches 2.. at @e[type=minecraft:armor_stand, name="LOOT_CHEST"] run setblock ~ ~ ~ minecraft:barrel{LootTable:"sg:tier_two"}
#execute if score #game LootChests matches 3.. at @e[type=minecraft:armor_stand, name="LOOT_CHEST"] run setblock ~ ~ ~ minecraft:barrel{LootTable:"sg:tier_three"}