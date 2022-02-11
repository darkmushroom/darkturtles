local du = require "darkturtleutils"

--[[
    _       _                    
__| |_ _ _(_)_ __ _ __  ___ _ _ 
(_-<  _| '_| | '_ \ '_ \/ -_) '_|
/__/\__|_| |_| .__/ .__/\___|_|  
            |_|  |_|            

  Simple strip miner
  written by mensing.alexander@gmail.com
  v0
--]]

local light = "adorn:stone_torch"
local fuel = "betterend:charcoal_block"
local length = 9
local freespace = 14

local function setup()
  du.clearScreen()
  print("Hello friend! I'm going to strip mine for you!")
  print("I should be placed on open ground, facing the direction you want to mine")
  print("Press any key to proceed.")
  io.read()
  
  du.clearScreen()
  print("Swag. I'm going to need something to light the tunnel as I dig")
  print("Please place my light source in the top-left of my inventory, then press any key to continue")
  io.read()
  turtle.select(1)
  if not(turtle.getItemDetail() == nil) then
      light = turtle.getItemDetail().name
  end

  du.clearScreen()
  print("I'm also going to need fuel to run on as I mine.")
  print("Please place the fuel in my 2nd inventory spot, next to the light source, then press any key to continue")
  io.read()
  turtle.select(2)
  if not(turtle.getItemDetail() == nil) then
      fuel = turtle.getItemDetail().name
  end

  du.clearScreen()
  print("Last thing. How far apart should I place each light?")
  length = tonumber(io.read())

  du.clearScreen()
  print("Awesome. Time to mine!")
end

local function digAllSides()
  turtle.digUp()
  turtle.dig()
  turtle.digDown()
end

local function mineStart()
  turtle.forward()
  turtle.turnLeft()
  turtle.forward()
  turtle.turnRight()
  turtle.up()
  turtle.dig()
  turtle.forward()
end

local function mineLoop()
  turtle.turnRight()
  digAllSides()
  turtle.forward()
  digAllSides()
  turtle.forward()
  turtle.turnLeft()
  digAllSides()
  turtle.forward()
  turtle.turnLeft()
  digAllSides()
  turtle.forward()
  digAllSides()
  turtle.forward()
  if (true) then --fix light placement
    turtle.turnLeft()
    du.grabSome(light)
    turtle.place()
    turtle.turnRight()
  end
  turtle.turnRight()
  digAllSides()
  turtle.forward()
end

local function main()
  setup()
  du.fuelCheck(fuel)
  mineStart()
  while freespace > 3 do
    for i=1, length, 1 do
      mineLoop()
    end
  end
end

main()