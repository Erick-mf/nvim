return {
   "nvim-treesitter/nvim-treesitter",
   dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
   },
   build        = ":TSUpdate",
   event        = "VeryLazy",
   main         = "nvim-treesitter.configs",
   opts         = {
      ensure_installed = {
         "css",
         "html",
         "javascript",
         "json",
         "lua",
         "luadoc",
         "markdown",
         "php",
         "scss",
         "sql",
         "bash",
         "typescript",
         "vim",
         "vimdoc",
         "xml",
         "yaml",
         "vue",
      },
      highlight = {
         enable = true,
      },
      indent = {
         enable = true,
      },
      incremental_selection = {
         enable = true,
         keymaps = {
            init_selection = "<C-space>",
            node_incremental = "<C-space>+",
            node_decremental = "<C-space>-",
            scope_incremental = "<C-space>c"
         },
      },
      textobjects = {
         select = {
            enable = true,
            lookahead = true,
            keymaps = {
               ["af"] = "@function.outer",
               ["if"] = "@function.inner",
               ["aC"] = "@class.outer",
               ["iC"] = "@class.inner",
               ["ac"] = "@conditional.outer",
               ["ic"] = "@conditional.inner",
               ["al"] = "@loop.outer",
               ["il"] = "@loop.inner",
            }
         }
      },
   },
}
