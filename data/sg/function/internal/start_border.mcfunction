# Border will shrink differently depending on the GameMaxTime
# (Minutes are converted into seconds)
execute if score #game GameMaxTime matches 15 run worldborder set 20 900 
execute if score #game GameMaxTime matches 30 run worldborder set 20 1800
execute if score #game GameMaxTime matches 45 run worldborder set 20 2700
execute if score #game GameMaxTime matches 60 run worldborder set 20 3600
execute if score #game GameMaxTime matches 75 run worldborder set 20 4500
execute if score #game GameMaxTime matches 90 run worldborder set 20 5400
execute if score #game GameMaxTime matches 105 run worldborder set 20 6300
execute if score #game GameMaxTime matches 120 run worldborder set 20 7200