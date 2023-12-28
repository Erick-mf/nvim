return {
    "neovim/nvim-lspconfig",
    events = "VeryLazy",
    dependencies = {
        "williamboman/mason.nvim",
        "folke/neodev.nvim",
    },
    config = function()
        vim.keymap.set('n', '<space>vd', vim.diagnostic.open_float)
        vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
        vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
        vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

        local on_attach = function(_, bufnr)
            vim.bo[bufnr].omnifunc = 'v:lua.vim.lsp.omnifunc'
            local opts = { buffer = bufnr }
            vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
            vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
            vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
            vim.keymap.set('n', '<space>vi', vim.lsp.buf.implementation, opts)
            vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
            vim.keymap.set('n', '<A-r>', vim.lsp.buf.rename, opts)
            vim.keymap.set({ 'n', 'v' }, '<space>vc', vim.lsp.buf.code_action, opts)
            vim.keymap.set('n', '<space>vr', vim.lsp.buf.references, opts)
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
            "lemminx",
            "marksman",
            "tsserver",
            "yamlls",
            "volar",
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
    end
}
