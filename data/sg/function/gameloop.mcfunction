# Welcome new members
execute as @a[tag=!HasLoggedIn] run tellraw @a ["",{"selector":"@s","bold":true,"color":"gold"},{"text":" entered the server for the first time, welcome!","color":"dark_aqua"}]
execute as @a[tag=!HasLoggedIn] run tag @s add HasLoggedIn

# Call core
execute if score #game PackInstantiated matches 2 run function sg:core
execute if score #game PackInstantiated matches 0..1 run function sg:states/pre_game

# Manage options
function sg:options/options