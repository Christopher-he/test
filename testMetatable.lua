
require "emmyDebug"
agent = {
    modules = {}
}
modules = {
    chat = 'chat.chat_impl',
    role = 'role.role_impl',
    lobby = 'lobby.lobby_impl',
    catch_fish = 'catch_fish.catch_fish_impl',
    disk = 'disk.disk_impl',
    marquee = 'marquee.marquee_impl',
    box = 'box.box_impl',
    fruit = 'fruit.fruit_impl',
    fund = 'fund.fund_impl',
    misc = 'misc.misc_impl',
    activity = 'activity.activity_impl',
}

--初始化agent子模块
initModules = function()
    setmetatable(
        agent.modules,
        {
            __index = function(t, k)
                local mod = modules[k]
                if not mod then
                    return nil
                end

                --local v = require(mod)
                t[k] = mod
                return mod
            end
        }
    )
end
initModules()
print(agent.modules.role)
print(agent.modules["role"])