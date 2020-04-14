# Reset kills 
scoreboard players set @a kills 0
scoreboard players set #game PlayersAlive 0

effect clear @a

# Give all active players the InGameTag
tag @a add InGame

# Clear winner tag from players
tag @a[tag=Winner] remove Winner

# Reset border
worldborder set 1500 0
worldborder center 0 0
worldborder warning distance 100

# Set shrinking value
worldborder set 10 1800

spreadplayers 0 0 200 725 false @a[gamemode=!creative, gamemode=!spectator]

# Set players alive count
execute as @a[gamemode=adventure] run scoreboard players add #game PlayersAlive 1

gamemode survival @a[gamemode=adventure]

# Setup sidebar
scoreboard players reset * DisplayVariable
scoreboard objectives setdisplay sidebar DisplayVariable
team join INTERNAL_SIDEBAR PlayersAlive:

function sg:internal/demolishlobby