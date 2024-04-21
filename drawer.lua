-- Drawer function

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
