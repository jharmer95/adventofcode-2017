function tokenize(str, delim)
    if delim == nil then
        delim = " "
    end

    local words = {}
    for s in string.gmatch(str, "([^" .. delim .."]+)") do
        table.insert(words, s)
    end
    return words
end

function getLines(filename)
    local lines = {}
    for line in io.lines(filename) do
        lines[#lines + 1] = line
    end
    return lines
end

function isAnagram(str1, str2)
    local strMap1 = {}
    local strMap2 = {}

    for c in str1:gmatch"." do
        if strMap1[c] == nil then
            strMap1[c] = 1
        else
            strMap1[c] = strMap1[c] + 1
        end
    end

    for c in str2:gmatch"." do
        if strMap2[c] == nil then
            strMap2[c] = 1
        else
            strMap2[c] = strMap2[c] + 1
        end
    end
    
    for key, val in pairs(strMap1) do
        if strMap2[key] == nil then
            return false
        elseif strMap2[key] ~= val then
            return false
        end
    end

    for key, val in pairs(strMap2) do
        if strMap1[key] == nil then
            return false
        elseif strMap1[key] ~= val then
            return false
        end
    end

    return true
end

if #arg ~= 1 then
    print("Please provide one argument (filename))")
    do return end
end

passwds = getLines(arg[1])

validCount = 0

for i, passwd in ipairs(passwds) do
    local words = tokenize(passwd)
    local isValid = true

    for i, word in ipairs(words) do
        local matchCount = 0
        for j, word2 in ipairs(words) do
            if word == word2 or isAnagram(word, word2) then
                matchCount = matchCount + 1
            end
        end

        if matchCount > 1 then
            isValid = false
        end
    end

    if isValid == true then
        validCount = validCount + 1
    end
end

print("Valid passwords: " .. validCount)
