def main():
    optionName = input("Option name: ")
    stateSelector = input("Selector for active states: ")
    gamerule = input("Gamerule: ")
    signText = input("Pretty option name: ")
    defaultActive = input("Active on default (y/n): ")
    if defaultActive not in ("y", "n"):
        print("Wrong value only y or n accepted")
        return
    if len(optionName) > 11:
        print("Name too long")
        return

    # Option sign
    if (defaultActive == "y"):
        print("/give @p minecraft:oak_sign{{BlockEntityTag:{{Text1:\'{{\"text\":\"\",\"clickEvent\":{{\"action\":\"run_command\",\"value\":\"/trigger Trig_{0} add 1\"}}}}\',Text2:\'{{\"color\":\"dark_aqua\",\"text\":\"{1}\",\"clickEvent\":{{\"action\":\"run_command\",\"value\":\"/execute as @p[scores={{Trig_{0}=1..}}] if score #game {0} matches 0 run data merge block ~ ~ ~ {{Text3:\\\'{{\\\\\"color\\\\\":\\\\\"green\\\\\", \\\\\"text\\\\\":\\\\\"[Enabled]\\\\\"}}\\\'}}\"}}}}\',Text3:\'{{\"color\":\"green\",\"text\":\"[Enabled]\"}}\',Text4:\'{{\"text\":\"\",\"clickEvent\":{{\"action\":\"run_command\",\"value\":\"/execute as @p[scores={{Trig_{0}=1..}}] if score #game {0} matches 1 run data merge block ~ ~ ~ {{Text3:\\\'{{\\\\\"color\\\\\":\\\\\"red\\\\\",\\\\\"text\\\\\":\\\\\"[Disabled]\\\\\"}}\\\'}}\"}}}}\'}},display:{{Name:\'{{\"text\":\"Custom Sign\"}}\'}}}}".format(optionName, signText))
    else:
        print("/give @p minecraft:oak_sign{{BlockEntityTag:{{Text1:\'{{\"text\":\"\",\"clickEvent\":{{\"action\":\"run_command\",\"value\":\"/trigger Trig_{0} add 1\"}}}}\',Text2:\'{{\"color\":\"dark_aqua\",\"text\":\"{1}\",\"clickEvent\":{{\"action\":\"run_command\",\"value\":\"/execute as @p[scores={{Trig_{0}=1..}}] if score #game {0} matches 0 run data merge block ~ ~ ~ {{Text3:\\\'{{\\\\\"color\\\\\":\\\\\"green\\\\\", \\\\\"text\\\\\":\\\\\"[Enabled]\\\\\"}}\\\'}}\"}}}}\',Text3:\'{{\"color\":\"red\",\"text\":\"[Disabled]\"}}\',Text4:\'{{\"text\":\"\",\"clickEvent\":{{\"action\":\"run_command\",\"value\":\"/execute as @p[scores={{Trig_{0}=1..}}] if score #game {0} matches 1 run data merge block ~ ~ ~ {{Text3:\\\'{{\\\\\"color\\\\\":\\\\\"red\\\\\",\\\\\"text\\\\\":\\\\\"[Disabled]\\\\\"}}\\\'}}\"}}}}\'}},display:{{Name:\'{{\"text\":\"Custom Sign\"}}\'}}}}".format(optionName, signText))

    # Create variables in init
    print("### Init function ###")
    print("scoreboard objectives add {0} dummy".format(optionName))
    print("scoreboard objectives add Trig_{0} trigger".format(optionName))
    print("scoreboard players set #game {0} {1}".format(optionName, (1 if defaultActive == "y" else 0)))
    
    print("### Option function ###")
    print("execute if score #game GameState matches 0..1 run scoreboard players enable @a[tag=Moderator] Trig_{0}".format(optionName))
    print("###################### {0} ######################".format(optionName))
    print("execute if score #game GameState matches {0} as @a[scores={{Trig_{1}=1..}}] run scoreboard players add #game {1} 1".format(stateSelector, optionName))
    print("execute if score #game GameState matches {0} if score #game {1} matches 2.. run scoreboard players set #game {1} 0".format(stateSelector, optionName))
    print("execute if score #game GameState matches {2} as @a[scores={{Trig_{0}=1..}}] if score #game {0} matches 0 run gamerule {1} false".format(optionName, gamerule, stateSelector))
    print("execute if score #game GameState matches {2} as @a[scores={{Trig_{0}=1..}}] if score #game {0} matches 1 run gamerule {1} true".format(optionName, gamerule, stateSelector))
    print("execute as @a[scores={{Trig_{0}=1..}}] run scoreboard players set @s Trig_{0} 0".format(optionName))
    
    input("Press enter to exit")

main()