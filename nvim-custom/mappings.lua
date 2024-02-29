local M = {}

M.general = {
  n = {
    ["<C-h>"] = { "<cmd> TmuxNavigateLeft<CR>", "window left"},
    ["<C-l>"] = { "<cmd> TmuxNavigateRight<CR>", "window right"},
    ["<C-j>"] = { "<cmd> TmuxNavigateDown<CR>", "window down"},
    ["<C-k>"] = { "<cmd> TmuxNavigateUp<CR>", "window up"},
    ["<C-i>"] = { "zi", "Fold toggle"},
    ["<C-M>"] = { "zM", "Fold close"},
  }
}

M.harpoon = {
  n = {
    ["<leader>a"] = { "<cmd>lua require('harpoon.mark').add_file()<cr>", "add file" },
    ["<C-e>"] = { "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", "harpoon menu" },
    ["<leader>1"] = { "<cmd> lua require('harpoon.ui').nav_file(1)<cr>", "file 1" },
    ["<leader>2"] = { "<cmd> lua require('harpoon.ui').nav_file(2)<cr>", "file 2" },
    ["<leader>3"] = { "<cmd> lua require('harpoon.ui').nav_file(3)<cr>", "file 3" },
    ["<leader>4"] = { "<cmd> lua require('harpoon.ui').nav_file(4)<cr>", "file 4" },

  },

}

M.tabufline = {
  plugin = true,
}

return M
