# Reset Kills 
scoreboard players reset * Kills
scoreboard players set @a Kills 0
scoreboard players set #game PlayersAlive 0
scoreboard players set #game TeamsAlive 0
scoreboard players reset * Deaths

# Revoke advancements
advancement revoke @a everything

# Give all active players the InGameTag
tag @a add InGame

gamemode survival @a
effect clear @a
xp set @a 0 levels
xp set @a 0 points
function sg:internal/clear_ender_chests

# Set time to day
time set 0
weather clear

# Set sec_timer to 0
scoreboard players set #game Sec_Timer 0
scoreboard players set #game Min_Timer 0

# Enable drops
gamerule doTileDrops true

# Clear winner tag from players
tag @a[tag=Winner] remove Winner

# Reset border
execute at @e[type=minecraft:armor_stand, name=Anchor] run worldborder center ~ ~
function sg:internal/set_map_size
function sg:internal/spread_players

# Setup sidebar
scoreboard players reset * DisplayVariable
scoreboard objectives setdisplay sidebar DisplayVariable
execute if score #game Teams matches 1 run team join INTERNAL_SIDEBAR TeamsAlive:
team join INTERNAL_SIDEBAR PlayersAlive:
team join INTERNAL_SIDEBAR Border:
team join INTERNAL_SIDEBAR Minutes:

function sg:internal/start_border

# Give all players invisibility in the start
effect give @a[tag=InGame] minecraft:invisibility 70 1 true

# Show title
title @a[tag=InGame] times 10 100 10
title @a[tag=InGame] subtitle {"text":"Last man standing wins!","color":"dark_aqua"}
title @a[tag=InGame] title {"text":"Fight!","bold":true,"color":"dark_aqua"}

# Spread loot crates if they are enabled
execute if score #game LootChests matches 1.. function sg:internal/loot_chests/spawn