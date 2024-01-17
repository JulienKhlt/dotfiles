---@type ChadrcConfig 
--
vim.opt.scrolloff = 8

local M = {}
 M.ui = {
  theme = 'catppuccin',
  tabufline = {enabled = false},
}
 M.plugins = "custom.plugins"
 M.mappings = require "custom.mappings"
 return M
