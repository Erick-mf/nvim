return {
   "nvimtools/none-ls.nvim",
   event = { "BufReadPre", "BufNewFile" },
   config = function()
      local null_ls = require("null-ls")

      local null_ls_utils = require("null-ls.utils")

      local formatting = null_ls.builtins.formatting
      local diagnostics = null_ls.builtins.diagnostics

      null_ls.setup({
         -- add package.json as identifier for root (for typescript monorepos)
         root_dir = null_ls_utils.root_pattern(".null-ls-root", "Makefile", ".git", "package.json", ".eslintrc"),
         sources = {
            null_ls.builtins.code_actions.refactoring,
            -- FORMATT
            formatting.prettier.with({ extra_args = { config_file = "~/.prettierrc.json" } }),

            -- DIAGNOSTICS
            diagnostics.eslint_d.with({
               condition = function(utils)
                  return utils.root_has_file({ ".eslintrc.js", ".eslintrc.cjs", ".eslintrc" }) -- only enable if root has .eslintrc.js or .eslintrc.cjs
               end,
            }),
         },
      })
   end,
}
