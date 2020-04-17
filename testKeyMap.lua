testmetable = setmetatable({key1 = "THIS ORI"}, {__index = {key2 = "THIS IS META2-1"}})
print(testmetable.key1, testmetable.key2)


