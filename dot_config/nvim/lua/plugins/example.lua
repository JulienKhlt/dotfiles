-- since this is just an example spec, don't actually load anything here and return an empty spec
-- stylua: ignore
if true then return {
  {
    "snacks.nvim",
    opts = {
      scroll = { enabled = false },
    },
  },
  { "bufferline.nvim", enabled = false },
  {"venv-selector.nvim", enabled = true},
} end
