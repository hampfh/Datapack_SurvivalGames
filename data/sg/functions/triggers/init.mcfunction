tellraw @a "Setting up survival games version 1.4"
tellraw @a ["",{"text":"Datapack author: ","color":"dark_aqua"},{"text":"Hampfh","bold":true,"color":"dark_aqua"},{"text":"\n"},{"text":"Pack available at: ","color":"dark_aqua"},{"text":"www.github.com/hampfh/Datapack_SurvivalGames","italic":true,"color":"dark_aqua","clickEvent":{"action":"open_url","value":"https://www.github.com/hampfh/Datapack_SurvivalGames"},"hoverEvent":{"action":"show_text","value":["",{"text":"Open the github repository","color":"dark_aqua"}]}}]

# Game rules
gamerule commandBlockOutput false
gamerule doImmediateRespawn true
gamerule showDeathMessages true
gamerule doTileDrops false
gamerule spectatorsGenerateChunks false
gamerule spawnRadius 0
gamerule doWeatherCycle false

# Setup variables
scoreboard objectives add DisplayVariable dummy "\u00A7a\u00A7l--Survival Games--"
scoreboard objectives add Kills playerKillCount "\u00A7a\u00A7l--Player Kills--"
scoreboard objectives add Leaves minecraft.custom:minecraft.leave_game
scoreboard objectives add PlayersAlive dummy 
scoreboard objectives add Deaths deathCount
scoreboard objectives add GameState dummy
scoreboard objectives add Wins dummy
# Timers
scoreboard objectives add Timer dummy
scoreboard objectives add Sec_Timer dummy
scoreboard objectives add Min_Timer dummy

# Settings
scoreboard objectives add Difficulty dummy 
scoreboard objectives add NoCoords dummy
scoreboard objectives add DeathMsg dummy
scoreboard objectives add ShowPrgress dummy
scoreboard objectives add UHCMode dummy
scoreboard objectives add FallDamage dummy

scoreboard objectives add Trig_GameStart trigger
scoreboard objectives add Trig_ChangeDiff trigger
scoreboard objectives add Trig_NoCoords trigger
scoreboard objectives add Trig_DeathMsg trigger
scoreboard objectives add Trig_ShowPrgress trigger
scoreboard objectives add Trig_NewMap trigger
scoreboard objectives add Trig_UHCMode trigger
scoreboard objectives add Trig_FallDamage trigger

scoreboard objectives setdisplay sidebar DisplayVariable
scoreboard objectives setdisplay list Wins

weather clear

# Summon anchor
summon armor_stand 0 400 0 {Invisible:1b,Invulnerable:1b,NoBasePlate:1b,NoGravity:1b,Small:1b,CustomName:"{\"text\":\"Anchor\"}"}

# Add teams
team add INTERNAL_SIDEBAR
team modify INTERNAL_SIDEBAR color dark_purple
team add Spectator
team modify Spectator color gray

scoreboard players set #game Difficulty 0
scoreboard players set #game NoCoords 1
scoreboard players set #game GameState 0
scoreboard players set #game Timer 0
scoreboard players set #game DeathMsg 1
scoreboard players set #game ShowPrgress 1
scoreboard players set #game UHCMode 0
scoreboard players set #game FallDamage 1

execute at @e[type=minecraft:armor_stand, name=Anchor] run setworldspawn ~ 205 ~

# Pre load chunks
execute at @e[type=minecraft:armor_stand, name=Anchor] run tp @a ~ 205 ~

function sg:internal/buildlobby 

# Reset worldborder
worldborder set 25 0
worldborder warning distance 0
execute at @e[type=minecraft:armor_stand, name=Anchor] run worldborder center ~ ~