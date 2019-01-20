_G.Engine = {
    loops = {},
    drawables = {}
}

function Engine:AddLoop(obj) 
    assert(obj.update, "ERROR::Engine::AddLoop:: Object is expected to have a update(self, dt) function")
    table.insert(self.loops, obj)
end

function Engine:RemoveLoop(obj) 
    for i, v in ipairs(self.loops) do
        if v == obj then
            table.remove(self.loops, i)
            return true
        end
    end
    return false
end

function Engine:AddDrawable(obj)
    assert(obj.draw, "ERROR::Engine::AddDrawable:: Object is expected to have a draw(self) function")
    obj.draw_layer = obj.draw_layer or 0 
    table.insert(self.drawables, obj)
end

function Engine:RemoveDrawable(obj)
    for i, v in ipairs(self.drawables) do
        if v == obj then
            table.remove(self.drawables, i)
            return true
        end
    end
    return false
end

function Engine:Update(dt)
    for i, v in ipairs(self.loops) do
        v:update(dt)
    end
end

function Engine:Render()
    table.sort(self.drawables, function(a, b)
        return a.draw_layer < b.draw_layer  
    end)

    for i, v in ipairs(self.drawables) do
        v:draw()
    end 
end
