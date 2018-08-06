require "tiledmap"

function love.load()
    _G.map = loadTiledMap("tilemap")    
end

function love.draw()
    _G.map:draw()
end
