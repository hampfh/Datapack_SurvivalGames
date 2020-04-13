# Generate lobby
setblock 0 200 0 minecraft:structure_block replace
data merge block 0 200 0 {mode:"LOAD", name:"sg:mainlobby", posX:-12, posZ:-12}
setblock 0 201 0 minecraft:redstone_block replace
setblock 0 200 0 air replace