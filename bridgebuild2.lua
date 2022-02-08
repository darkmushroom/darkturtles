-- Nether Ice Bridge Builder
-- v0.0

-- Initialization --

-- section length is lightsource slice + distance to next light
local section_length = 5
local fuel = "betterend:charcoal_block"

-- tunnel materials
local foundation = "blockus:marble_bricks_slab"
local foundation_corner = "blockus:marble_bricks_stairs"
local track = "minecraft:packed_ice"
local railing = "computercraft:cable"
local wall_bottom = "blockus:marble_bricks"
local wall_middle = "minecraft:glass_pane"
local wall_top = "blockus:marble_bricks"
local roof = "blockus:marble"
local light = "blockus:redstone_lamp_lit"

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

local function buildSlice()
  --building bottom half 1 of 2
  grabSome(foundation)
  turtle.placeDown()
  turtle.turnLeft()
  turtle.forward()
  grabSome(track)
  turtle.placeDown()
  turtle.forward()
  grabSome(foundation_corner)
  turtle.placeDown()
  -- building left wall + left rail
  grabSome(wall_bottom)
  turtle.place()
  turtle.up()
  grabSome(railing)
  turtle.placeDown()
  grabSome(wall_middle)
  turtle.place()
  turtle.up()
  grabSome(wall_top)
  turtle.place()
  -- working on the roof
  grabSome(roof)
  turtle.placeUp()
  turtle.back()
  turtle.up()
  turtle.turnRight()
  turtle.turnRight()
  grabSome(roof)
  turtle.placeUp()
  turtle.forward()
  grabSome(light)
  turtle.placeUp()
  turtle.forward()
  grabSome(roof)
  turtle.placeUp()
  grabSome(roof)
  turtle.place()
  turtle.down()
  turtle.forward()
  -- building the right wall
  grabSome(wall_top)
  turtle.place()
  turtle.down()
  grabSome(wall_middle)
  turtle.place()
  turtle.down()
  grabSome(wall_bottom)
  turtle.place()
  -- building bottom half 2 of 2
  grabSome(foundation_corner)
  turtle.placeDown()
  turtle.back()
  grabSome(track)
  turtle.placeDown()
  grabSome(railing)
  turtle.place()
  turtle.back()
  turtle.back()
  grabSome(railing)
  turtle.place()
  -- orient for next slice
  turtle.turnLeft()
  turtle.forward()
  turtle.turnRight()
  turtle.forward()
  turtle.turnLeft()
end

local function buildSection()
  fuelCheck() -- make sure we're juiced up
  local templight = light
  buildSlice() -- build first slice with light
  light = roof -- build the rest with roof blocks
  for i=1, section_length-1, 1 do
    buildSlice()
  end
  light = templight
end

local function main()
  print("Hello and welcome to the nether bridge builder v1")
  print("This program builds an ice rail in sections "..section_length.." long.")
  print("How many sections should I build?")
  local sections = tonumber(io.read())
  for i=1, sections, 1 do
    buildSection()
  end
end

main()