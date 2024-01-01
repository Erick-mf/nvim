return {
    "nvim-telescope/telescope.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "nvim-telescope/telescope-ui-select.nvim",
        "nvim-telescope/telescope-file-browser.nvim",
        {
            'nvim-telescope/telescope-fzf-native.nvim',
            build = 'make'
        }
    },
    config = function()
        require "config.plugins.telescope"
    end,
    keys = {
        {
            "<leader>fs",
            function()
                require('telescope.builtin').grep_string()
            end,
            desc = "Telescope Git Files",
        },
        {
            "<leader>fw",
            function()
                require('telescope.builtin').live_grep()
            end,
            desc = "Telescope Git Files",
        },
        {
            "<leader>ff",
            function()
                local opts = { show_untracked = true }
                local ok = pcall(require('telescope.builtin').git_files, opts)
                if not ok then
                    require('telescope.builtin').find_files(opts)
                end
            end,
            desc = "Telescope Git Files",
        },
        {
            "<leader>B",
            function()
                require("telescope.builtin").buffers()
            end,
            desc = "Telescope buffers",
        },
        {
            "<leader>gs",
            function()
                require("telescope.builtin").git_status()
            end,
            desc = "Telescope Git status",
        },
        {
            "<leader>gc",
            function()
                require('telescope.builtin').git_commits()
            end,
            desc = "Git Commits",
        },
        {
            "<leader>fh",
            function()
                return require("telescope.builtin").find_files {
                    prompt_title = " Hidden Files",
                    hidden = true,
                    file_ignore_patterns = {},
                }
            end,
            desc = "Find hidden files"
        },
        {
            "<leader>fa",
            function()
                require("telescope.builtin").help_tags()
            end,
            desc = "Telescope Help"
        },
        {
            "<leader>fb",
            function()
                require("telescope").extensions.file_browser.file_browser({
                    path = "%:h:p",
                    select_buffer = true
                })
            end,
            desc = "Telescope file browser"
        },
        {
            "<leader>fp",
            function()
                require("telescope").extensions.file_browser.file_browser({
                    prompt_title = " Plugins",
                    cwd = "~/.config/nvim-3/lua/plugins"
                })
            end,
            desc = "Telescope file browser"
        },
        { "<leader>tn", "<cmd>Telescope todo-comments keywords=TODO,NOTE<cr>", desc = "Todos" },
        { "<leader>tf", "<cmd>Telescope todo-comments keywords=FIX,BUG<cr>",   desc = "Todo Fix" },
    },
}
