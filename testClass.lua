--require "emmyDebug"

oTest1 = {}
oTest1.src1 = 12121
function oTest1:print()
    print(self.src1)
end
oTest1:print()


--2分法遍历数组
function table.lowerBound(elements, x, field)
    local first = 0
    local mid, half
    local len = #elements
    while len > 0 do
        half = math.floor(len / 2)
        mid = first + half
        local element = elements[mid + 1]
        local value = field and element[field] or element
        if value < x then
            first = mid + 1
            len = len - half - 1
        else
            len = half
        end
    end
    return first + 1
end


ori = os.time()
test1 = os.date("*t", ori)
test2 = os.date("!*t", ori)

val1 = os.time(test1)
val2 = os.time(test2)
print(test1, test2)

--按照1-24时制 计算val在哪个时值
function calcTimeSeq()
    nowtime = os.time()
    time = os.date("*t", nowtime)
    tmp = time
    for i = 1, 24 do
        tmp.hour = i
        tmp.min = 0
        tmp.sec = 0
        if nowtime <= os.time(tmp) then
            return i
        end
    end
    return 0
end

calcTimeSeq()

local Weight = {
    {0.1144,    0.1144,    0.1144,    0.1144,    0.1144,    0.1144,    0.1136,    0.2},
    {0.09152,   0.09152,   0.09152,   0.09152,   0.09152,   0.09152,   0.09088,   0.36},
    {0.073216,  0.073216,  0.073216,  0.073216,  0.073216,  0.073216,  0.072704,  0.488},
    {0.0585728, 0.0585728, 0.0585728, 0.0585728, 0.0585728, 0.0585728, 0.0581632, 0.5904},
    {0.0292864, 0.0292864, 0.0292864, 0.0292864, 0.0292864, 0.0292864, 0.0290816, 0.7952},
    {0.0234291, 0.0234291, 0.0234291, 0.0234291, 0.0234291, 0.0234291, 0.0232653, 0.83646},
    {0.143,     0.143,     0.143,     0.143,     0.143,     0.143,     0.142,     0},
}

--@num 玩家现有不同种类卡片数
local function checkCardDropWeight(num)
    assert(num >= 0 and num <= #Weight)
    if num == 7 then
        --玩家已经收集全部卡片
        return 0
    end
    num = num ~= 0 and num or #Weight
    rz = math.random()
    val = 0
    for i = 1, #Weight[num] do
        val = val + Weight[num][i]
        if rz  <= val then
            assert(not(num == 7 and i == 8), string.format("玩家现有不同种类卡片:%d    抽中卡片:%d    %f ? %f", (num == 7 and 0 or num) , (i == 8 and 0 or i), rz, val))
            print(string.format("玩家现有不同种类卡片:%d    抽中卡片:%d    %f ? %f", (num == 7 and 0 or num), (i == 8 and 0 or i), rz, val))
            return i == 8 and 0 or i
        end
    end
    assert(true, "抽卡权重计算失败")
end
for i = 1, 10 do
    --checkCardDropWeight(math.random(0, 7))
    checkCardDropWeight(0)
end


ttttt = {card1 = {}, card2 = {}}
table.insert(ttttt.card1, {val1 = 1, val2 = 2})
table.insert(ttttt.card1, {val1 = 1, val2 = 2})
ttttt.card2.val1 = 1
ttttt.card2.val2 = 2
print(ttttt)

for key, value in pairs(ttttt.card1) do
    if key == 1 then
        value.val1 = 3
    end
end
print(ttttt)

kkkk = {}
if kkkk[1023] == nil then
    kkkk[1023] = 1023
end

kkkk[2] = 2
print(kkkk[1023])
print(kkkk[2])


local Weight = {
    {0.1144,    0.1144,    0.1144,    0.1144,    0.1144,    0.1144,    0.1136,    0.2},
    {0.09152,   0.09152,   0.09152,   0.09152,   0.09152,   0.09152,   0.09088,   0.36},
    {0.073216,  0.073216,  0.073216,  0.073216,  0.073216,  0.073216,  0.072704,  0.488},
    {0.0585728, 0.0585728, 0.0585728, 0.0585728, 0.0585728, 0.0585728, 0.0581632, 0.5904},
    {0.0292864, 0.0292864, 0.0292864, 0.0292864, 0.0292864, 0.0292864, 0.0290816, 0.7952},
    {0.0234291, 0.0234291, 0.0234291, 0.0234291, 0.0234291, 0.0234291, 0.0232653, 0.83646},
    {0.143,     0.143,     0.143,     0.143,     0.143,     0.143,     0.142,     0},
}
local function checkCardDropWeight(num)
    local oriNum = num
    assert(num >= 0 and num <= #Weight)
    --玩家已经收集7张卡片
    num = num == 7 and 6 or num
    --玩家当前无卡片
    num = num == 0 and #Weight or num
    local rz = math.random()
    local val = 0
    for i = 1, #Weight[num] do
        val = val + Weight[num][i]
        if rz  <= val then
            return i
        end
    end
    assert(false, "抽卡权重计算失败")
end
local tableid = 3
print(string.format("表%d 校验10000次", tableid))
local cardStat = {0, 0, 0, 0, 0, 0, 0, 0}
for i = 1, 10000 do
    local cardId = checkCardDropWeight(tableid)
    cardStat[cardId] = cardStat[cardId] + 1
end
for key, value in pairs(cardStat) do
    print(string.format("卡%d-%d张", key, value))
end

cat = 3
dog = 2
ret = dog or cat
print(ret)