
# Enable moderators to click on signs
execute if score #game GameState matches 0..1 run scoreboard players enable @a[tag=Moderator] Trig_GameStart

###################### ChangeDiff ######################
execute if score #game GameState matches 0..1 run scoreboard players enable @a[tag=Moderator] Trig_ChangeDiff
execute if score #game GameState matches 0..1 as @a[scores={Trig_ChangeDiff=1..}] run scoreboard players add #game Difficulty 1
execute if score #game GameState matches 0..1 if score #game Difficulty matches 4.. run scoreboard players set #game Difficulty 0
execute if score #game GameState matches 0..1 as @a[scores={Trig_ChangeDiff=1..}] run tellraw @a ["",{"text":"New difficulty is ", "color":"dark_aqua"},{"score": {"name":"#game","objective":"Difficulty"}, "bold": true, "color": "dark_purple"}]
execute if score #game GameState matches 0..1 as @a[scores={Trig_ChangeDiff=1..}] store result storage minecraft:settings difficulty short 1 run scoreboard players get #game Difficulty
execute as @a[scores={Trig_ChangeDiff=1..}] run scoreboard players set @s Trig_ChangeDiff 0
###################### NoCoords ######################
execute if score #game GameState matches 0..1 run scoreboard players enable @a[tag=Moderator] Trig_NoCoords
execute if score #game GameState matches 0..1 as @a[scores={Trig_NoCoords=1..}] run scoreboard players add #game NoCoords 1
execute if score #game GameState matches 0..1 if score #game NoCoords matches 2.. run scoreboard players set #game NoCoords 0
execute if score #game GameState matches 0..1 as @a[scores={Trig_NoCoords=1..}] if score #game NoCoords matches 0 run gamerule reducedDebugInfo true
execute if score #game GameState matches 0..1 as @a[scores={Trig_NoCoords=1..}] if score #game NoCoords matches 1 run gamerule reducedDebugInfo false
execute as @a[scores={Trig_NoCoords=1..}] run scoreboard players set @s Trig_NoCoords 0
###################### DeathMsg ######################
execute if score #game GameState matches 0..1 run scoreboard players enable @a[tag=Moderator] Trig_DeathMsg
execute if score #game GameState matches 0..1 as @a[scores={Trig_DeathMsg=1..}] run scoreboard players add #game DeathMsg 1
execute if score #game GameState matches 0..1 if score #game DeathMsg matches 2.. run scoreboard players set #game DeathMsg 0
execute if score #game GameState matches 0..1 as @a[scores={Trig_DeathMsg=1..}] if score #game DeathMsg matches 0 run gamerule showDeathMessages false
execute if score #game GameState matches 0..1 as @a[scores={Trig_DeathMsg=1..}] if score #game DeathMsg matches 1 run gamerule showDeathMessages true
execute as @a[scores={Trig_DeathMsg=1..}] run scoreboard players set @s Trig_DeathMsg 0
###################### ShowPrgress ######################
execute if score #game GameState matches 0..1 run scoreboard players enable @a[tag=Moderator] Trig_ShowPrgress
execute if score #game GameState matches 0..1 as @a[scores={Trig_ShowPrgress=1..}] run scoreboard players add #game ShowPrgress 1
execute if score #game GameState matches 0..1 if score #game ShowPrgress matches 2.. run scoreboard players set #game ShowPrgress 0
execute if score #game GameState matches 0..1 as @a[scores={Trig_ShowPrgress=1..}] if score #game ShowPrgress matches 0 run gamerule announceAdvancements false
execute if score #game GameState matches 0..1 as @a[scores={Trig_ShowPrgress=1..}] if score #game ShowPrgress matches 1 run gamerule announceAdvancements true
execute as @a[scores={Trig_ShowPrgress=1..}] run scoreboard players set @s Trig_ShowPrgress 0
###################### Move map ######################
execute if score #game GameState matches 0..1 run scoreboard players enable @a[tag=Moderator] Trig_NewMap
execute if score #game GameState matches 0..1 as @a[scores={Trig_NewMap=1..}] run tellraw @a ["",{"text":"Generating new terrain...","color":"dark_aqua","clickEvent":{"action":"open_url","value":"www.github.com/hampfh"},"hoverEvent":{"action":"show_item","value":"Open site"}}]
execute if score #game GameState matches 0..1 as @a[scores={Trig_NewMap=1..}] run function sg:state_initializers/pre_move
execute as @a[scores={Trig_NewMap=1..}] run scoreboard players set @s Trig_NewMap 0
###################### UHCMode ######################
execute if score #game GameState matches 0..1 run scoreboard players enable @a[tag=Moderator] Trig_UHCMode
execute if score #game GameState matches 0..1 as @a[scores={Trig_UHCMode=1..}] run scoreboard players add #game UHCMode 1
execute if score #game GameState matches 0..1 if score #game UHCMode matches 2.. run scoreboard players set #game UHCMode 0
execute if score #game GameState matches 0..1 as @a[scores={Trig_UHCMode=1..}] if score #game UHCMode matches 0 run gamerule naturalRegeneration true
execute if score #game GameState matches 0..1 as @a[scores={Trig_UHCMode=1..}] if score #game UHCMode matches 1 run gamerule naturalRegeneration false
execute as @a[scores={Trig_UHCMode=1..}] run scoreboard players set @s Trig_UHCMode 0
###################### FallDamage ######################
execute if score #game GameState matches 0..1 run scoreboard players enable @a[tag=Moderator] Trig_FallDamage
execute if score #game GameState matches 0..1 as @a[scores={Trig_FallDamage=1..}] run scoreboard players add #game FallDamage 1
execute if score #game GameState matches 0..1 if score #game FallDamage matches 2.. run scoreboard players set #game FallDamage 0
execute if score #game GameState matches 0..1 as @a[scores={Trig_FallDamage=1..}] if score #game FallDamage matches 0 run gamerule fallDamage false
execute if score #game GameState matches 0..1 as @a[scores={Trig_FallDamage=1..}] if score #game FallDamage matches 1 run gamerule fallDamage true
execute as @a[scores={Trig_FallDamage=1..}] run scoreboard players set @s Trig_FallDamage 0

# Reset gamestart trigger
execute as @a[scores={Trig_GameStart=1..}] run scoreboard players set @s Trig_GameStart 0