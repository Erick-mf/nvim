---@diagnostic disable: missing-fields
return {
    "rcarriga/nvim-notify",
    event = "VeryLazy",
    config = function()
        require("notify").setup({
            background_colour = "#000000",
            render = "compact",
            stages = "static",
        })
        -- this overwrites the vim notify function
        vim.notify = require("notify").notify
    end,
}
