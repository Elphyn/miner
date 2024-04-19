--  Tunnel 

function checkBlock()
    while turtle.detect() do
    turtle.dig()
    end
end 
while true do
    checkBlock()
    turtle.forward()
    turtle.digDown()
    turtle.turnLeft()
    checkBlock()
    turtle.turnRight()
    turtle.turnRight()
    checkBlock() 
    turtle.down()
    checkBlock()
    turtle.turnLeft()
    turtle.turnLeft()
    checkBlock()
    turtle.up() 
    turtle.digUp()
    turtle.up()
    checkBlock()
    turtle.turnRight()
    turtle.turnRight()
    checkBlock()
    turtle.down()
    turtle.turnLeft()

end