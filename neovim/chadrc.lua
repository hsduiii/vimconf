---@type ChadrcConfig
local M = {}

M.ui = { theme = 'onedark' }

-- lazy.nvim plugins
M.plugins = "custom.plugins"

M.mappings = require "custom.mappings"

return M
