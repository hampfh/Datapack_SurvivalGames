# Depending on the mapsize variable the worldborder will have different sizes

execute if score #game MapSize matches 50 run worldborder set 50 0
execute if score #game MapSize matches 50 run worldborder warning distance 10
execute if score #game MapSize matches 100 run worldborder set 100 0
execute if score #game MapSize matches 100 run worldborder warning distance 20
execute if score #game MapSize matches 200 run worldborder set 200 0
execute if score #game MapSize matches 200 run worldborder warning distance 40
execute if score #game MapSize matches 400 run worldborder set 400 0
execute if score #game MapSize matches 400 run worldborder warning distance 80
execute if score #game MapSize matches 800 run worldborder set 800 0
execute if score #game MapSize matches 800 run worldborder warning distance 160
execute if score #game MapSize matches 1600 run worldborder set 1600 0
execute if score #game MapSize matches 1600 run worldborder warning distance 320
execute if score #game MapSize matches 3200 run worldborder set 3200 0
execute if score #game MapSize matches 3200 run worldborder warning distance 640