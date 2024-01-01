return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "williamboman/mason.nvim",
        "folke/neodev.nvim",
    },
    config = function()
        vim.keymap.set('n', '<space>vd', vim.diagnostic.open_float)
        -- vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
        -- vim.keymap.set('n', ']d', vim.diagnostic.goto_next)

        local on_attach = function(_, bufnr)
            vim.bo[bufnr].omnifunc = 'v:lua.vim.lsp.omnifunc'
            local opts = { buffer = bufnr }
            vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
            vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
            vim.keymap.set('n', '<space>vi', vim.lsp.buf.implementation, opts)
            vim.keymap.set('n', '<A-r>', vim.lsp.buf.rename, opts)
            vim.keymap.set({ 'n', 'v' }, '<space>vc', vim.lsp.buf.code_action, opts)
            vim.keymap.set('n', '<space>vr', "<cmd>Telescope lsp_references<CR>", opts)
            vim.keymap.set('n', '<A-f>', function()
                vim.lsp.buf.format { async = true }
            end, opts)
        end
        require("neodev").setup()
        local lspconfig = require("lspconfig")

        local servers = {
            "cssls",
            "html",
            "jsonls",
            "marksman",
            "tsserver",
            "taplo",
            "phpactor",
            "jdtls",
        }
        for _, server in pairs(servers) do
            lspconfig[server].setup {
                on_attach = on_attach,
            }
        end
        lspconfig["emmet_ls"].setup {
            on_attach = on_attach,
            filetypes = { "html", "css", "sass", "scss", "javascript", "vue" },
        }

        lspconfig["lua_ls"].setup({
            on_attach = on_attach,
            settings = {
                Lua = {
                    telemetry = { enable = false },
                    workspace = { checkThirdParty = false },
                }
            }
        })

      lspconfig["volar"].setup({
         on_attach = on_attach,
         init_options = {
            typescript = {
               tsdk ="/home/usuario/.local/share/nvim-3/mason/packages/vue-language-server/node_modules/typescript/lib",
            }
         }
      })
    end
}
