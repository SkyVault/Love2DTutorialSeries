local Renderer = require "renderer"
local GameLoop = require "gameloop"
require "utilities"

local time = {
    dt = 0.0,
    timer = 0.0,
    ticks = 0,
    fps = 0.0, 
}

Game = {
    Renderer = Renderer,
    GameLoop = GameLoop,

    Time = {
        dt = 0.0,
        timer = 0.0,
        ticks = 0,
        fps = 0.0,
    }
}
 
function love.load()
end

function love.update(dt) 
    time.dt = dt
    time.timer = time.timer + dt
    time.ticks = time.ticks + 1
    time.fps = 1.0 / dt

    Game.Time = Copy(time)

    GameLoop:update(dt)
end

function love.draw()
    Renderer.draw()
end
