local darkutils = {}

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

local function clearScreen()
  term.clear()
  term.setCursorPos(1,1)
end

return darkturtleutils
