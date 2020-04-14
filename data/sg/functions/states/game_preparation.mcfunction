# Game preparation state

# Increase timer
execute if score #game Timer matches ..20 run scoreboard players add #game Timer 1
# Increaes second
execute if score #game Timer matches 20.. run scoreboard players remove #game Sec_Timer 1
# Reset tick timer
execute if score #game Timer matches 20.. run scoreboard players set #game Timer 0

# Swap gamestate when Sec_Timer reaches 0
execute if score #game Sec_Timer matches ..0 run scoreboard players set #game GameState 2

# Display sidebar
scoreboard players operation TimeLeft: DisplayVariable = #game Sec_Timer
team join INTERNAL_SIDEBAR TimeLeft:

# Start game
execute if score #game Sec_Timer matches ..0 run function sg:internal/gamestart