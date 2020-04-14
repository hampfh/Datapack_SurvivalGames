# Reset kills 
scoreboard players reset * kills
scoreboard players set #game PlayersAlive 0
scoreboard players reset * Deaths

effect clear @a

# Give all active players the InGameTag
tag @a add InGame

# Set time to day
time set 0
weather clear

# Clear winner tag from players
tag @a[tag=Winner] remove Winner

# Reset border
worldborder set 1500 0
worldborder center 0 0
worldborder warning distance 100

spreadplayers 0 0 200 725 false @a[tag=InGame]

# Set players alive count
execute as @a[tag=InGame] run scoreboard players add #game PlayersAlive 1

gamemode survival @a[tag=InGame]

# Setup sidebar
scoreboard players reset * DisplayVariable
scoreboard objectives setdisplay sidebar DisplayVariable
team join INTERNAL_SIDEBAR PlayersAlive:

function sg:internal/demolishlobby

# Set shrinking value
worldborder set 10 1800