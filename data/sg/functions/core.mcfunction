
# State definition
# State 0 - lobby state
# State 1 - prepare game state
# State 2 - game state

# Tag definition
# Moderator - access to executing signs
# Winner - last player that won the game
# InGame - determinds if a player is in game or out of game

# Run lobby states
execute if score #game GameState matches 0 run function sg:states/lobby 
execute if score #game GameState matches 1 run function sg:states/game_preparation
execute if score #game GameState matches 2 run function sg:states/game

# Reset trigger Trig_GameStart
execute as @a[scores={Trig_GameStart=1..}] run scoreboard players set @s Trig_GameStart 0