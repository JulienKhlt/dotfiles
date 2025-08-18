-- ~/.config/nvim/lua/plugins/ty.lua
return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")
      local configs = require("lspconfig.configs")
      local util = require("lspconfig.util")

      -- Define the server once (prevents redefinition on reload)
      if not configs.ty then
        configs.ty = {
          default_config = {
            cmd = { "ty", "server" }, -- needs ty on PATH (Mason or manual)
            filetypes = { "python" },
            root_dir = function(fname)
              return util.root_pattern("pyproject.toml", "setup.cfg", "setup.py", "requirements.txt", ".git")(fname)
                or vim.loop.cwd()
            end,
            settings = {
              ty = {
                -- Recommended: let Pyright handle language features;
                -- Ty adds fast type-check diagnostics.
                disableLanguageServices = true,
                diagnosticMode = "workspace", -- or "openFilesOnly"
              },
            },
          },
        }
      end

      -- Keep Pyright (from LazyVim’s python extra) and add Ty
      lspconfig.ruff.setup({})
      lspconfig.pyright.setup({})
      lspconfig.ty.setup({})
    end,
  },
}
