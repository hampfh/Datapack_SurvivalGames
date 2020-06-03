

# Increase end game timer
execute if score #game Timer matches 20.. run scoreboard players add #end_game Sec_Timer 1
execute if score #end_game Sec_Timer matches 60.. run scoreboard players add #end_game Min_Timer 1
execute if score #end_game Sec_Timer matches 60.. run scoreboard players set #end_game Sec_Timer 0

# End blip function when sudden death starts
#execute if score #end_game Min_Timer matches 2.. run schedule clear <CLEAR BLIP FUNCTION HERE>

execute if score #end_game Min_Timer matches 2.. run function sg:state_initializers/pre_sudden_death
