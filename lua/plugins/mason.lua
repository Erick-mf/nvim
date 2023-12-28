return {
    "williamboman/mason.nvim",
    cmd = "Mason",
    events = "VeryLazy",
    dependencies = {
        "williamboman/mason-lspconfig.nvim",
        "jayp0521/mason-null-ls.nvim",
    },
    opts = {
        ui = {
            border = "rounded",
            width = 0.7,
            height = 0.7,
            icons = {
                package_installed = "✓",
                package_pending = "➜",
                package_uninstalled = "✗",
            },
        },
    },
    config = function(opts)
        require("mason").setup(opts)

        local mason_lspconfig = require("mason-lspconfig")
        local mason_null_ls = require("mason-null-ls")

        mason_lspconfig.setup({
            ensure_installed = {
                "cssls",
                "emmet_ls",
                "html",
                "jsonls",
                "volar",
                "lemminx",
                "lua_ls",
                "marksman",
                "tsserver",
                "yamlls",
            },
            automatic_installation = true,
        })

        mason_null_ls.setup({
            ensure_installed = {
                "prettier",
                "eslint_d",
            },
            automatic_installation = true,
        })
    end
}
