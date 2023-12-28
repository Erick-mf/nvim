-- undercurl
vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Ce = "\e[4:0m"]])

-- Disable the concealing in some file formats
vim.api.nvim_create_autocmd({ "FileType" }, {
    pattern = { "json", "jsonc", "markdown" },
    callback = function()
        vim.wo.conceallevel = 0
    end,
})

--turn off paste mode when leaving insert
vim.api.nvim_create_autocmd("InsertLeave", {
    pattern = "*",
    command = "set nopaste",
})

vim.diagnostic.config {
    float = {
        border = "rounded"
    },
    virtual_text = true
}

vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(
    vim.lsp.handlers.hover,
    { border = 'rounded' }
)

-- Change the Diagnostic symbols in the sign column (gutter)
local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end


local banned_messages = { "No information available", "No signature help available"}
---@diagnostic disable-next-line: duplicate-set-field
vim.notify = function(msg, ...)
    for _, banned in ipairs(banned_messages) do
        if msg == banned then
            return
        end
    end
    return require("notify")(msg, ...)
end
