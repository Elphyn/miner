-- Main file
-- Basic set up


-- Download software on the disk


-- Place first turtle and boot it up
turtle.up()
turtle.select(3)
turtle.place()
sleep(0.2)
peripheral.call("front", "turnOn")

-- Spawning turtles
local count = 1
while true do
    if turtle.detect() then
        sleep(0.1)
    else
        turtle.select(3+count)
        turtle.place()
        sleep(0.2)
        peripheral.call("front", "turnOn")
        count = count + 1
    end
end

