local plugins = {
  {
    "zbirenbaum/copilot.lua",

    cmd = "Copilot",
    build = ":Copilot auth",
    event = "InsertEnter",
    opts = {
      suggestion = {
        enabled = true,
        auto_trigger = true,
        keymap = {
          accept = "<tab>",
        },
      },
      panel = { enabled = false },
      filetypes = {
        markdown = true,
        help = true,
        python = true,
      },
    },
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    ft = {"python", "json"},
    opts = function()
      return require "custom.configs.null-ls"
    end,
  },
  {
   "christoomey/vim-tmux-navigator",
    lazy = false,
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "black",
        "pyright",
        "ruff",
        "isort",
        "fixjson",
      },
    },
  },
  {
    "theprimeagen/harpoon",
  },
  {
    "kylechui/nvim-surround",
    event = "VeryLazy",
    config = function()
        require("nvim-surround").setup({
            -- Configuration here, or leave empty to use defaults
        })
    end
  },
  {
    "tpope/vim-fugitive",
    opt = true,
    cmd = {
      "G", "Git", "Gdiffsplit", "Gvdiffsplit", "Gedit", "Gsplit",
      "Gread", "Gwrite", "Ggrep", "Glgrep", "Gmove",
      "Gdelete", "Gremove", "Gbrowse",
    },
  },
  {
    'simrat39/symbols-outline.nvim',
    event = "VeryLazy",
    opts={},
  },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    event = "VeryLazy",
    opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
    }
  },
  {
    "chaoren/vim-wordmotion",
    lazy = false,
  },
  {
    'ggandor/leap.nvim',
     enabled = true,
     keys = {
       { "s", mode = { "n", "x", "o" }, desc = "Leap forward to" },
       { "S", mode = { "n", "x", "o" }, desc = "Leap backward to" },
       { "gs", mode = { "n", "x", "o" }, desc = "Leap from windows" },
     },
     config = function(_, opts)
       local leap = require("leap")
       for k, v in pairs(opts) do
         leap.opts[k] = v
       end
       leap.add_default_mappings(true)
       vim.keymap.del({ "x", "o" }, "x")
       vim.keymap.del({ "x", "o" }, "X")
       require("leap").add_repeat_mappings(";", ",", {
        relative_directions = true,
        modes = { "n", "x", "o" },
       })
     end,
  },
  { "tpope/vim-repeat", event = "VeryLazy" },
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    lazy = false,
    enabled = true,
    keys = {
      { "]m", false }, -- already tried without those 2 lines
      { "[m", false },
    },
    ft = { "go", "gomod" },
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = function()
      require("custom.configs.treesitter_textobject")
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
}
return plugins
