return {
    "Exafunction/codeium.vim",
    event = "InsertEnter",
    init = function()
        local codeium_filetype = {
            [".env"] = false
        }
        vim.g.codeium_filetypes = codeium_filetype
    end,
    config = function()
        vim.keymap.set('i', '<A-Enter>', function() return vim.fn['codeium#Accept']() end, { expr = true, silent = true })
        vim.keymap.set('i', '<A-n>', function() return vim.fn['codeium#CycleCompletions'](-1) end,
            { expr = true, silent = true })
        vim.keymap.set('i', '<A-m>', function() return vim.fn['codeium#CycleCompletions'](1) end,
            { expr = true, silent = true })
        vim.keymap.set('i', '<A-x>', function() return vim.fn['codeium#Clear']() end, { expr = true, silent = true })
    end
}
