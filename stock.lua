--require "emmyDebug"

local moduleName, funcName = string.match("activity.activity_db", "(%w+)%.(%w+)")

local db = {[1] = 22, [121] = 11}
print(#db)
local c = string.sub( "DB_MYSQL", 1, 1)
if c == '.' then
    rew =  false
else
    rew = true
end
if not rew then
    print("dsssssssss")
end
function stockRatePrint(src)
    for i = 10, -10, -1 do
        print(string.format( "%d%%---------------------%.2f", i, src * (1 + i / 100.00)))
    end
end


--local val = ...
while 0 do
    local val = io.read()
    stockRatePrint(val)    
end



