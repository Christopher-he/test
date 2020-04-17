
function coroutineTest()
    -- body
    while 0 do
        --协诚工作区
        -- body

        --任务完成先挂起
        coroutine.yield()
    end
end

function init()
    -- body
    pool = {}
    for i = 1, 10 do
        -- body
        pool[i] = coroutine.create(coroutineTest())
        ASSERT(coroutine.resume(pool[i]))
    end
end

function getCoroutine()
    -- body
    for src in pairs(pool) do
        -- body
        if "running" == coroutine.status(src) then
            -- body
            return src
        end
    end
    return nil
end