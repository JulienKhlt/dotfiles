return {
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      local configs = require("lspconfig.configs")
      local util = require("lspconfig.util")

      -- define custom server once
      if not configs.ty then
        configs.ty = {
          default_config = {
            cmd = { "ty", "server" },
            filetypes = { "python" },
            root_dir = function(fname)
              return util.root_pattern("pyproject.toml", "setup.cfg", "setup.py", "requirements.txt", ".git")(fname)
                or vim.loop.cwd()
            end,
            settings = {
              ty = {
                -- Let Pyright handle language features; Ty for fast diagnostics
                disableLanguageServices = true,
                diagnosticMode = "workspace",
              },
            },
          },
        }
      end

      opts.servers = opts.servers or {}
      -- Configure pyright for completions and type checking
      opts.servers.pyright = vim.tbl_deep_extend("force", opts.servers.pyright or {}, {
        settings = {
          python = {
            analysis = {
              autoImportCompletions = true,
              typeCheckingMode = "basic",
            },
          },
        },
      })
      opts.servers.ruff = opts.servers.ruff or {}

      -- now add Ty (LazyVim will set it up alongside others)
      opts.servers.ty = {}
    end,
  },
}

