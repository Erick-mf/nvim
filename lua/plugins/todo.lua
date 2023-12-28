return {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    event = { "BufReadPost", "BufNewFile" },
    opts = {
        highlight = {
            keyword = "fg",
        }
    },
    keys = {
        { "[t", function() require("todo-comments").jump_prev() end, desc = "Previous ToDo comment" },
        { "]t", function() require("todo-comments").jump_next() end, desc = "Next ToDo comment" },
    },
}
