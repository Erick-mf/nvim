return {
    "nvim-telescope/telescope.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "nvim-telescope/telescope-file-browser.nvim",
        {
            'nvim-telescope/telescope-fzf-native.nvim',
            build = 'make'
        }
    },
    config = function()
        require('telescope').setup({
            defaults = {
                layout_strategy = "flex",
                layout_config = {
                    prompt_position = "top",
                },
                sorting_strategy = "ascending",
            },
            extensions = {
                fzf = {
                    fuzzy = true,               -- false will only do exact matching
                    override_generic_sorter = true, -- override the generic sorter
                    override_file_sorter = true, -- override the file sorter
                    case_mode = "smart_case",   -- or "ignore_case" or "respect_case"
                    -- the default case_mode is "smart_case"
                },
            }
        })
        require('telescope').load_extension('fzf')
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
            "<leader>gf",
            function()
                require('telescope.builtin').git_files({ show_untracked = true })
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
            "<leader>ff",
            function()
                require('telescope.builtin').find_files()
            end,
            desc = "Telescope Find Files",
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
                require("telescope").extensions.file_browser.file_browser({ path = "%:h:p", select_buffer = true })
            end,
            desc = "Telescope file browser"
        }
    },
}
