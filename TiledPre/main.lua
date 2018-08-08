require "tiledmap"

function love.load()
    _G.map = loadTiledMap("tilemapanimated")    
end

function love.draw()
    _G.map:draw()
end

function love.update(dt)
    _G.map:update(dt)
end
