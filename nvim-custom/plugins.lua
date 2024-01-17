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
    "chaoren/vim-wordmotion",
    lazy = false,
  },
  {
    'ggandor/lightspeed.nvim',
    event = "VeryLazy"
  },
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
