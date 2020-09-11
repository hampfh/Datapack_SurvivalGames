tellraw @a [{"text":"Late game started\n", "color":"dark_aqua", "bold":true},{"text":"Players will now sporadically be revealed", "bold":false}]
tellraw @a [{"text":"Sudden death in ", "color":"gold"},{"text":"2", "bold":true, "color":"gold"}, {"text":" minutes", "color":"gold"}]

# Instantiate timers
scoreboard players set #end_game Sec_Timer 0
scoreboard players set #end_game Min_Timer 0

# Start "blipping" players (reveal players)
function sg:internal/blip_players

# Change gamestate
scoreboard players set #game GameState 3

# Remove loot crates in end game
execute if score #game LootChests matches 1.. run function sg:internal/loot_chests/remove