# Display all players for 1 second
effect give @a[tag=InGame] minecraft:glowing 1 1 true

# Re-schedule to run once again after 10 seconds
schedule function sg:internal/blip_players 6s