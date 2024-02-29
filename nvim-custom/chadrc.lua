---@type ChadrcConfig 
--
vim.opt.scrolloff = 8
vim.opt.foldmethod = "indent"
vim.opt.foldlevel = 99
vim.opt.foldclose = "all"

local M = {}
 M.ui = {
  theme = 'catppuccin',
  tabufline = {enabled = false},
}
 M.plugins = "custom.plugins"
 M.mappings = require "custom.mappings"
 return M
