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
    lines = {}
    for line in io.lines(filename) do
        lines[#lines + 1] = line
    end
    return lines
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
            if word == word2 then
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
