local du = require "darkturtleutils"

-- Nether Ice Bridge Excavator
-- v1.0

-- Initialization --

-- section length is lightsource slice + distance to next light

local fuel = "betterend:charcoal_block"
local foundation = "minecraft:netherrack"

-- optionally digs up and places foundation underneath
-- if block below is not foundation
local function placeFoundation()
  local isablock, theblock = turtle.inspectDown()
    if not((theblock.name == foundation)) then
      turtle.digDown()
      du.grabSome(foundation)
      turtle.placeDown()
  end
end

local function dig()
  turtle.dig()
  turtle.forward()
  turtle.digUp()
  turtle.digDown()
  turtle.down()
  placeFoundation()
  turtle.turnLeft()
  turtle.dig()
  turtle.forward()
  turtle.digUp()
  turtle.dig()
  placeFoundation()
  turtle.forward()
  turtle.digUp()
  placeFoundation()
  turtle.up()
  turtle.digUp()
  turtle.dig()
  turtle.up()
  turtle.digUp()
  turtle.dig()
  turtle.up()
  turtle.digUp()
  turtle.dig()
  turtle.turnRight()
  turtle.turnRight()
  turtle.dig()
  turtle.forward()
  turtle.digUp()
  turtle.dig()
  turtle.digDown()
  turtle.up()
  turtle.digUp()
  turtle.dig()
  turtle.forward()
  turtle.digUp()
  turtle.dig()
  turtle.digDown()
  turtle.forward()
  turtle.digUp()
  turtle.dig()
  turtle.digDown()
  turtle.down()
  turtle.dig()
  turtle.digDown()
  turtle.forward()
  turtle.dig()
  turtle.digDown()
  turtle.down()
  turtle.dig()
  turtle.digDown()
  turtle.down()
  turtle.dig()
  turtle.digDown()
  turtle.down()
  turtle.turnLeft()
  turtle.turnLeft()
  turtle.dig()
  placeFoundation()
  turtle.forward()
  turtle.digUp()
  placeFoundation()
  turtle.forward()
  turtle.turnRight()
  turtle.up()
end

local function main()
  du.clearScreen()
  print("Hello and welcome to the nether bridge excavator v1")
  print("How far should I dig?")
  local distance = tonumber(io.read())
  for i=1, distance, 1 do
    du.fuelCheck()
    dig()
  end
end

main()