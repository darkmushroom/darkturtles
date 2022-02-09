local du = require "darkturtleutils"

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

local function buildSlice()
  --building bottom half 1 of 2
  du.grabSome(foundation)
  turtle.placeDown()
  turtle.turnLeft()
  turtle.forward()
  du.grabSome(track)
  turtle.placeDown()
  turtle.forward()
  du.grabSome(foundation_corner)
  turtle.placeDown()
  -- building left wall + left rail
  du.grabSome(wall_bottom)
  turtle.place()
  turtle.up()
  du.grabSome(railing)
  turtle.placeDown()
  du.grabSome(wall_middle)
  turtle.place()
  turtle.up()
  du.grabSome(wall_top)
  turtle.place()
  -- working on the roof
  du.grabSome(roof)
  turtle.placeUp()
  turtle.back()
  turtle.up()
  turtle.turnRight()
  turtle.turnRight()
  du.grabSome(roof)
  turtle.placeUp()
  turtle.forward()
  du.grabSome(light)
  turtle.placeUp()
  turtle.forward()
  du.grabSome(roof)
  turtle.placeUp()
  du.grabSome(roof)
  turtle.place()
  turtle.down()
  turtle.forward()
  -- building the right wall
  du.grabSome(wall_top)
  turtle.place()
  turtle.down()
  du.grabSome(wall_middle)
  turtle.place()
  turtle.down()
  du.grabSome(wall_bottom)
  turtle.place()
  -- building bottom half 2 of 2
  du.grabSome(foundation_corner)
  turtle.placeDown()
  turtle.back()
  du.grabSome(track)
  turtle.placeDown()
  du.grabSome(railing)
  turtle.place()
  turtle.back()
  turtle.back()
  du.grabSome(railing)
  turtle.place()
  -- orient for next slice
  turtle.turnLeft()
  turtle.forward()
  turtle.turnRight()
  turtle.forward()
  turtle.turnLeft()
end

local function buildSection()
  du.fuelCheck() -- make sure we're juiced up
  local templight = light
  buildSlice() -- build first slice with light
  light = roof -- build the rest with roof blocks
  for i=1, section_length-1, 1 do
    buildSlice()
  end
  light = templight
end

local function main()
  du.clearScreen()
  print("Hello and welcome to the nether bridge builder v1")
  print("This program builds an ice rail in sections "..section_length.." long.")
  print("How many sections should I build?")
  local sections = tonumber(io.read())
  for i=1, sections, 1 do
    buildSection()
  end
end

main()