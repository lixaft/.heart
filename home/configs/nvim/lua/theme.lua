local theme_file = vim.fn.stdpath("config") .. "/theme.json"
local f = io.open(theme_file, "r")
local data = f:read("*a")
f:close()
return vim.json.decode(data)
