function Const(tab)
    return setmetatable({}, {
        __index = function(o, key) 
            assert(tab[key], "Attepted to index a non-existant table entry")
            return tab[key]
        end,
        
        __newindex = function(o, key, value)
            assert(false, "Attepted to modify a constant table")
        end,
    })
end

function Copy(orig)
    local orig_type = type(orig)
    local copy
    if orig_type == 'table' then
        copy = {}
        for orig_key, orig_value in next, orig, nil do
            copy[Copy(orig_key)] = Copy(orig_value)
        end
        setmetatable(copy, Copy(getmetatable(orig)))
    else -- number, string, boolean, etc
        copy = orig
    end
    return copy
end
