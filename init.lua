local function make_particels(pos)
    minetest.add_particlespawner({
        amount = 30,
        time = 0.2,
        minpos = vector.subtract(pos, 0.5),
        maxpos = vector.add(pos, 0.5),
        minvel = {x = -1, y = 1, z = -1},
        maxvel = {x = 1, y = 3, z = 1},
        minacc = {x = 0, y = -9.8, z = 0},
        maxacc = {x = 0, y = -9.8, z = 0},
        minexptime = 0.5,
        maxexptime = 1,
        minsize = 1,
        maxsize = 2,
        texture = "default_item_smoke.png",
        glow = 5,
    })
end

local function make_jump_effect(num, user)
    local pos = user:get_pos()
    if pos then 
        make_particels(user:get_pos())
    end
    
    user:add_velocity({x = 0, y = num, z = 0})

    minetest.sound_play("tnt_explode", {
        pos = user:get_pos(),
        gain = 1.0,
        max_hear_distance = 10,
    })
end

minetest.register_tool("escaping_feather:feather_small", {
    description = "Escaping Feather Small",
    inventory_image = "escaping_feather.png^[colorize:#49e3f1:80",
    stack_max = 1,
    on_use = function(itemstack, user, pointed_thing)
        if not user then return itemstack end
        make_jump_effect(10, user)
        return ""
    end,
})


minetest.register_tool("escaping_feather:feather_medium", {
    description = "Escaping Feather Medium",
    inventory_image = "escaping_feather.png^[colorize:#8eec99:80",
    stack_max = 1,
    on_use = function(itemstack, user, pointed_thing)
        if not user then return itemstack end
        make_jump_effect(15, user)
        return ""
    end,
})


minetest.register_tool("escaping_feather:feather_large", {
    description = "Escaping Feather Large",
    inventory_image = "escaping_feather.png^[colorize:#f5b16e:80",
    stack_max = 1,
    on_use = function(itemstack, user, pointed_thing)
        if not user then return itemstack end
        make_jump_effect(25, user)
        return ""
    end,
})