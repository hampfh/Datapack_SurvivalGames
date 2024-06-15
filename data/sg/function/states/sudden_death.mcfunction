
# Decrease timer before start
execute if score #game Timer matches 20.. if score #sudden_death Sec_Timer matches 0.. run scoreboard players remove #sudden_death Sec_Timer 1
execute if score #game Timer matches 20.. if score #sudden_death Sec_Timer matches 1.. run tellraw @a [{"score":{"name":"#sudden_death", "objective":"Sec_Timer"}, "color":"gold", "bold":true}]

# Force all players to look down while waiting
execute if score #sudden_death Sec_Timer matches 1.. run execute as @a at @s run tp @s[tag=InGame] ~ ~ ~ facing ~ 0 ~

# Display fight message
execute if score #game Timer matches 20.. if score #sudden_death Sec_Timer matches 0 run tellraw @a [{"text":"Fight!", "bold":true, "color":"gold"}]
execute if score #game Timer matches 20.. if score #sudden_death Sec_Timer matches 0 run effect clear @a[tag=InGame]