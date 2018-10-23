local Renderer = require "renderer"

Game = {
    Renderer = Renderer
}

function love.load()
end

function love.draw()
    Renderer.draw()
end
