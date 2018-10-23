local loops = {}

local
function add(object)
    assert(object.update, "GameLoop::Add:: object requires an update function") 
    table.insert(loops, object)
end

local
function remove(object)
    for i, v in ipairs(loops) do
        if v == object then
            table.remove(loops, i)
        end
    end
end

local
function update(dt)
    for i, v in ipairs(loops) do
        v:update(dt)
    end
end

return {
    add = add,
    remove = remove,
    update = update
}
