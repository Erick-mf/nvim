require("telescope").setup({
    defaults = {
        file_ignore_patterns = { "%.zip", "lazy-lock.json", "node_modules", "live-server", "vendor" },
        layout_strategy = "flex",
        layout_config = {
            prompt_position = "top",
        },
        selection_strategy = "reset",
        sorting_strategy = "ascending",
        scroll_strategy = "limit",
        mappings = {
            n = {
                ["<C-c>"] = "close",
                ["<C-h>"] = "which_key",
            },
            i = {
                ["<C-h>"] = "which_key",
                ["<C-c>"] = "close",
            },
        },
    },
    extensions = {
        fzf = {
            fuzzy = true,                   -- false will only do exact matching
            override_generic_sorter = true, -- override the generic sorter
            override_file_sorter = true,    -- override the file sorter
            case_mode = "smart_case",       -- or "ignore_case" or "respect_case"
            -- the default case_mode is "smart_case"
        },
        ["ui-select"] = {
            require("telescope.themes").get_dropdown {
                borderchars = {
                    prompt = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
                    results = { "─", "│", "─", "│", "╭", "╮", "┤", "├" },
                    preview = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
                },
                width = 0.8,
                previewer = false,
            },
        },
    }
})
require('telescope').load_extension('fzf')
require("telescope").load_extension "notify"
require('telescope').load_extension('ui-select')
require("telescope").load_extension "file_browser"
