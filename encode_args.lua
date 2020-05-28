
local function escape(s)
    return (string.gsub(s, "([^A-Za-z0-9_])", function(c)
        return string.format("%%%02X", string.byte(c))
    end))
end

return function (params)
    local body = {}
    for k,v in pairs(params) do
        table.insert(body, string.format("%s=%s",escape(k),escape(v)))
    end
    return table.concat(body , "&")
end