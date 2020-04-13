tellraw @a "Setting up survival games"

# Game rules
gamerule commandBlockOutput false
gamerule doImmediateRespawn true
gamerule showDeathMessages true

# Setup kill variable
scoreboard objectives add kills playerKillCount "Player kills"
scoreboard objectives setdisplay list kills
scoreboard objectives add Deaths deathCount
scoreboard objectives add GameState dummy
scoreboard objectives add Timer dummy
scoreboard objectives add PlayersAlive dummy 
# Settings
scoreboard objectives add Difficulty dummy 
scoreboard objectives add NoCoords dummy

scoreboard objectives add Trig_GameStart trigger
scoreboard objectives add Trig_ChangeDiff trigger
scoreboard objectives add Trig_NoCoords trigger

scoreboard players set #game Difficulty 0
scoreboard players set #game NoCoords 1
scoreboard players set #game GameState 0

setworldspawn 0 205 0

function sg:internal/buildlobby 