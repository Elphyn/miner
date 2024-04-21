-- Client



-- Drawer function

function Drawer()

    local slots = {}
    local drawer_id = 1


    -- Mapping all cobbled_deepslate
    for slot = 2, 16 do
        local count = turtle.getItemDetail(slot)
        if turtle.getItemDetail(slot) then
            if (count.name == "minecraft:cobbled_deepslate") then
                table.insert(slots, slot)
            end
        end
    end

    -- Deposit all cobbled_deepslate into a Drawer
    if #slots then
        turtle.select(drawer_id)
        turtle.place()
        for _, item in ipairs(slots) do
            turtle.select(item)
            turtle.drop()
        end
        turtle.select(drawer_id)
        turtle.dig()
    end
    -- Turtle goes back to do it's thing
    for i = 1, 2 do
        turtle.turnLeft()
    end

    -- Turtle should return drawer to first slot
end

-- Tunnel function 
function Tunnel()
    local function checkBlock()
        while turtle.detect() do
            turtle.dig()
        end    
    end
    local function forward()
        while true do
            checkBlock()
            turtle.forward()
            turtle.turnLeft()
            checkBlock()
        
            turtle.turnRight()
            turtle.turnRight()
            checkBlock()

            turtle.digUp()  --
            turtle.up()
            checkBlock()
            turtle.turnLeft()
            turtle.turnLeft()
            checkBlock()
            turtle.down()
        
            turtle.digDown()
            turtle.down()
            checkBlock()
            turtle.turnLeft()
            turtle.turnLeft()
            checkBlock()
            turtle.up()
            turtle.turnLeft()
        
        
        end 
    end
    forward()
end


-- In this file turtle should connect to a server 
-- and wait for instructions

-- Establishing connection
DEFAULT_CLIENT_PORT = 100
SERVER_PORT = 10

local modem = peripheral.wrap("right")

modem.open(DEFAULT_CLIENT_PORT)

modem.transmit(SERVER_PORT, DEFAULT_CLIENT_PORT, "Turtle initiated a handshake")
-- print("First interaction with a server")
local _, _, _, _, message, _ = os.pullEvent("modem_message")

-- print("You're given a slot number: ", message)

local new_port = message
modem.close(DEFAULT_CLIENT_PORT)
-- print("Closed default port")
modem.open(new_port)
-- print("Opened new port: ", new_port)


sleep(2)
modem.transmit(SERVER_PORT, new_port, "I'm ready!")
print("Turtle is ready")

-- Waiting for instructions

local _, _, senderChannel, _, instruction, _ = os.pullEvent("modem_message")

-- move(instruction)

for i = 1, instruction do
    turtle.forward()
end
turtle.turnLeft()
turtle.forward()
-- shell.run("proj/tunnel")
Tunnel()

