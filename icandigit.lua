-- Nether Ice Bridge Excavator
-- v1.0

-- Initialization --

-- section length is lightsource slice + distance to next light

local fuel = "betterend:charcoal_block"
local foundation = "minecraft:netherrack"

-- will search for and select a block if found,
-- otherwise prompt user input
local function grabSome(block)
  -- short circuit if item is already selected
  if turtle.getItemCount() > 0 then
    if turtle.getItemDetail().name == block then
      return true
    end
  end
  
  -- No luck. Gotta search
  for i=1, 16, 1 do
    turtle.select(i)
    if turtle.getItemCount() > 0 then
      if turtle.getItemDetail().name == block then
        return true
      end
    end
  end
  print("We're out of "..block.."!")
  print("Please insert "..block.." then press [Enter] to continue.")
  boob = io.read()
  grabSome(block)
end

local function fuelCheck()
  if turtle.getFuelLevel() < 80 then
    grabSome(fuel)
    turtle.refuel(1)
  end
end

-- optionally digs up and places foundation underneath
-- if block below is not foundation
local function placeFoundation()
  local isablock, theblock = turtle.inspectDown()
    if not((theblock.name == foundation)) then
      turtle.digDown()
      grabSome(foundation)
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
  print("Hello and welcome to the nether bridge excavator v1")
  print("How far should I dig?")
  local distance = tonumber(io.read())
  for i=1, distance, 1 do
    fuelCheck()
    dig()
  end
end

main()