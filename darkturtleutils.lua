local darkturtleutils = {}

function darkturtleutils.grabSome(block)
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
  darkturtleutils.grabSome(block)
end


function darkturtleutils.fuelCheck()
  if turtle.getFuelLevel() < 80 then
    darkturtleutils.grabSome(fuel)
    turtle.refuel(1)
  end
end

function darkturtleutils.clearScreen()
  term.clear()
  term.setCursorPos(1,1)
end

return darkturtleutils
