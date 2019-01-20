require "engine"

function love.load()
end

function love.update(dt)
    Engine:Update(dt)
end

function love.draw()
    Engine:Render()
end
