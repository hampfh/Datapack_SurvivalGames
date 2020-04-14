tellraw @a "Setting up survival games"
tellraw @a ["",{"text":"Datapack author: ","color":"dark_aqua"},{"text":"Hampfh","bold":true,"color":"dark_aqua"},{"text":"\n"},{"text":"Pack available at: ","color":"dark_aqua"},{"text":"www.github.com/hampfh/Datapack_SurvivalGames","italic":true,"color":"dark_aqua","clickEvent":{"action":"open_url","value":"https://www.github.com/hampfh/Datapack_SurvivalGames"},"hoverEvent":{"action":"show_text","value":["",{"text":"Open the github repository","color":"dark_aqua"}]}}]

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
scoreboard objectives add Sec_Timer dummy
scoreboard objectives add PlayersAlive dummy 
# Settings
scoreboard objectives add Difficulty dummy 
scoreboard objectives add NoCoords dummy

scoreboard objectives add Trig_GameStart trigger
scoreboard objectives add Trig_ChangeDiff trigger
scoreboard objectives add Trig_NoCoords trigger

scoreboard objectives add DisplayVariable dummy "\u00A7a\u00A7l--Survival Games--"
scoreboard objectives setdisplay sidebar DisplayVariable

# Add teams
team add INTERNAL_SIDEBAR
team modify INTERNAL_SIDEBAR color dark_purple
team add Spectator
team modify Spectator color gray

scoreboard players set #game Difficulty 0
scoreboard players set #game NoCoords 1
scoreboard players set #game GameState 0

worldborder warning distance 100

setworldspawn 0 205 0

# Pre load chunks
tp @a 0 255 0

function sg:internal/buildlobby 

# Reset worldborder
worldborder set 25 0
worldborder warning distance 0