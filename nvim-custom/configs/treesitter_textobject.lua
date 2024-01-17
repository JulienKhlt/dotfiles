require("nvim-treesitter.configs").setup({
  textobjects = {
    enable = true,
    keymaps = {
      -- or you use the queries from supported languages with textobjects.scm
      ["af"] = "@function.outer",
      ["if"] = "@function.inner",
      ["aC"] = "@class.outer",
      ["iC"] = "@class.inner",
      ["ac"] = "@conditional.outer",
      ["ic"] = "@conditional.inner",
      ["ae"] = "@block.outer",
      ["ie"] = "@block.inner",
      ["al"] = "@loop.outer",
      ["il"] = "@loop.inner",
      ["iv"] = "@statement.inner",
      ["av"] = "@statement.outer",
      ["ad"] = "@comment.outer",
      ["am"] = "@call.outer",
      ["im"] = "@call.inner",
      ["aP"] = "@parameter.outer",
      ["iP"] = "@parameter.inner",
    },
    move = {
      enable = true,
      set_jumps = true, -- whether to set jumps in the jumplist
      goto_next_start = {
        ["]]"] = "@function.outer",
        ["]e"] = "@block.outer",
      },
      goto_next_end = {
        ["]["] = "@function.outer",
        ["]E"] = "@block.outer",
      },
      goto_previous_start = {
        ["[["] = "@function.outer",
        ["[e"] = "@block.outer",
      },
      goto_previous_end = {
        ["[]"] = "@function.outer",
        ["[E"] = "@block.outer",
      },
    },
    select = {
      enable = true,
      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["aC"] = "@class.outer",
        ["iC"] = "@class.inner",
        ["ac"] = "@conditional.outer",
        ["ic"] = "@conditional.inner",
        ["ae"] = "@block.outer",
        ["ie"] = "@block.inner",
        ["al"] = "@loop.outer",
        ["il"] = "@loop.inner",
        ["is"] = "@statement.inner",
        ["as"] = "@statement.outer",
      },
    },
  },
})
