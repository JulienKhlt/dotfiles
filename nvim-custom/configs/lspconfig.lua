local config = require("plugins.configs.lspconfig")

local on_attach = config.on_attach
local capabilities = config.capabilities

capabilities.textDocument.publishDiagnostics.tagSupport.valueSet = { 2 }

local lspconfig = require("lspconfig")

lspconfig.pyright.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = {"python"},
  -- settings = {
  --   python = {
  --     analysis = { diagnosticMode = "off", typeCheckingMode = "off" },
  --   },
  -- },
})

lspconfig.jsonls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = {"json", "jsonl"}
})

lspconfig.yamlls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = {"yaml"},
  settings = {
    yaml = {
      validate = true,
      -- disable the schema store
      schemaStore = {
        enable = false,
        url = "",
      },
      -- manually select schemas
      schemas = {
        ["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
        ["/home/julien.khlaut/raidium/medsam/schema.json"] = "/home/julien.khlaut/raidium/medsam/configs/*.yaml"
      }
    }
  }
})


lspconfig.tsserver.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = {"typescript", "typescriptreact", "typescript.tsx"},
})
