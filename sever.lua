--  Server

--  This file is a server that turtles connect to
--  and are given insturctions 
-- print("Enter number of turtles: ")
-- SLOTS = io.read("*n")
SLOTS = 6
DEFAULT_CLIENT_PORT = 100
SERVER_PORT = 10

local modem = peripheral.wrap("right")

modem.open(DEFAULT_CLIENT_PORT)
modem.open(SERVER_PORT)


-- Getting turtles ready for further instructions
local num = SLOTS
local count = 3
local iteration = 1
while (true) do
    print("Iteration: ", iteration)
    -- if (num < 1) then
    --     break
    -- end
    local _, _, _, replyChannel, message, _ = os.pullEvent("modem_message")
    print("Recieved message: ", message)
    if (replyChannel == 100) then
        print("Recieved new turtle!")
        modem.transmit(replyChannel, SERVER_PORT, num)
        num = num - 1
        print("Allocated slot to a new turtle!")
    else
        print("Welcome new turtle!")
        print("Turtle on channel: ", replyChannel, "added to the list")
        modem.transmit(replyChannel, SERVER_PORT, count)
        count = count + 3
    end
    iteration = iteration + 1
    sleep(0.1)
end



-- Test

