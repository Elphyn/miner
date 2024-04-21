-- Tunnel function 
function tunnel()
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
