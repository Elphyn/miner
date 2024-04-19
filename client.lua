-- Client

-- In this file turtle should connect to a server 
-- and wait for instructions

-- Establishing connection
DEFAULT_CLIENT_PORT = 100
SERVER_PORT = 10

local modem = peripheral.wrap("right")

modem.open(DEFAULT_CLIENT_PORT)

modem.transmit(SERVER_PORT, DEFAULT_CLIENT_PORT, "Turtle initiated handshake")
print("First interaction with a server")
local _, _, _, _, message, _ = os.pullEvent("modem_message")

print("You're given a slot number: ", message)

local new_port = message
modem.close(DEFAULT_CLIENT_PORT)
print("Closed default port")
modem.open(new_port)
print("Opened new port: ", new_port)


sleep(2)
modem.transmit(SERVER_PORT, new_port, "I'm ready!")
print("Transmit done")

-- Waiting for instructions

local _, _, senderChannel, _, instruction, _ = os.pullEvent("modem_message")

-- move(instruction)

for i = 1, instruction do
    turtle.forward()
end
turtle.turnLeft()
turtle.forward()
shell.run("proj/tunnel")

