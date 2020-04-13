# Reset kills 
scoreboard players set @a kills 0
scoreboard players set #game PlayersAlive 0

effect clear @a

# Reset border
worldborder set 2500 0
worldborder center 0 0

# Set shrinking value
worldborder set 10 1800

spreadplayers 0 0 800 1000 false @a

# Set players alive count
execute as @a[gamemode=adventure] run scoreboard players add #game PlayersAlive 1

gamemode survival @a[gamemode=adventure]

function sg:internal/demolishlobby