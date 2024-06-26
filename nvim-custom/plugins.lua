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
    ft = {"python", "json", "typescript"},
    opts = function()
      return require "custom.configs.null-ls"
    end,
  },
  {
   "christoomey/vim-tmux-navigator",
    lazy = false,
  },
  {
    "rcarriga/nvim-dap-ui",
    dependencies = "mfussenegger/nvim-dap",
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")
      dapui.setup()
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end
    end
  },
  {
    "mfussenegger/nvim-dap",
    config = function(_, opts)
      require("core.utils").load_mappings("dap")
    end
  },
  {
    "mfussenegger/nvim-dap-python",
    ft = "python",
    dependencies = {
      "mfussenegger/nvim-dap",
      "rcarriga/nvim-dap-ui",
      "nvim-neotest/nvim-nio",
    },
    config = function(_, opts)
      local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
      require("dap-python").setup(path)
      require("core.utils").load_mappings("dap_python")
    end,
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
        "yaml-language-server",
        "json-lsp",
        "typescript-language-server",
        "prettier",
        "eslint-lsp",
        "debugpy",
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
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function()
      local opts_nvchad = require "plugins.configs.treesitter"
      local opts_custom = require "custom.configs.treesitter"
      return vim.tbl_deep_extend("force", opts_nvchad, opts_custom)
    end,
  },
  {
  'pwntester/octo.nvim',
  lazy = false,
  enabled = true,
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope.nvim',
    -- OR 'ibhagwan/fzf-lua',
    'nvim-tree/nvim-web-devicons',
  },
  config = function ()
    require"octo".setup()
  end
  }
}
return plugins
