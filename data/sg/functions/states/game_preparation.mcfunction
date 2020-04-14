# Game preparation state

# Increaes second
execute if score #game Timer matches 20.. run scoreboard players remove #game Sec_Timer 1

# Swap gamestate when Sec_Timer reaches 0
execute if score #game Sec_Timer matches ..0 run scoreboard players set #game GameState 2

# Display sidebar
scoreboard players operation TimeLeft: DisplayVariable = #game Sec_Timer
team join INTERNAL_SIDEBAR TimeLeft:

# If "start game" sign is pressed again decrease time
execute if score #game Sec_Timer matches ..59 as @a[scores={Trig_GameStart=1..}] if score #game Sec_Timer matches 11.. run scoreboard players remove #game Sec_Timer 5

# Start game
execute if score #game Sec_Timer matches ..0 run function sg:state_initializers/post_game_preparation