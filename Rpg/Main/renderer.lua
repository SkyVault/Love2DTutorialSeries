local renderers = {}

local
function add(object, layer)
    assert(object.draw, "Renderer::Add:: object requires a draw function")
    local layer = layer or 0

    object.drawLayer = layer

    table.insert(renderers, object)
end

local
function remove(object)
    for i, v in ipairs(renderers) do
        if v == object then
            table.remove(renderers, i)
        end
    end
end

local
function draw()
    table.sort(renderers, function(a, b)
        return a.drawLayer < b.drawLayer
    end)

    for i, v in ipairs(renderers) do
        v:draw()
    end
end

return {
    add = add,
    remove = remove,
    draw = draw
}
