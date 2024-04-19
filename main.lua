-- Main file
-- Basic set up

-- Place diskDrive
turtle.select(1)
turtle.place()

-- Select disk
turtle.select(2)

-- Drop disk into diskDrive with startup.lua
turtle.drop()

-- Place turtle and boot it up
turtle.up()
turtle.select(3)
turtle.place()

-- Spawning turtles
local count = 1
while true do
    if turtle.detect() then
        sleep(0.1)
    else
        turtle.select(3+count)
        turtle.place()
        count = count + 1
    end
end


-- sleep(5)
-- turtle.forward()
-- shell.run("disk/startup")
-- -- 
