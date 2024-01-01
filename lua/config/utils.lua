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
    virtual_text = true,
    float = {
        border = "single"
    },
}

vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(
    vim.lsp.handlers.hover,
    { border = 'single' }
)

-- Change the Diagnostic symbols in the sign column (gutter)
local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

local banned_messages = { "No information available", "No signature help available" }
---@diagnostic disable-next-line: duplicate-set-field
vim.notify = function(msg, ...)
    for _, banned in ipairs(banned_messages) do
        if msg == banned then
            return
        end
    end
    return require("notify")(msg, ...)
end

local function agregar_plugin()
    vim.ui.input({ prompt = "Nombre del archivo: " }, function(name)
        if name == nil or name == "" then
            return
        end

        vim.ui.input({ prompt = "Url del plugin: " }, function(url)
            if url == nil or url == "" then
                return
            end

            vim.cmd("e ~/.config/nvim-3/lua/plugins/" .. name .. ".lua")

            local content = {
                "return {",
                "    " .. url,
                "}"
            }

            vim.api.nvim_buf_set_lines(0, 0, -1, false, content)
            vim.api.nvim_win_set_cursor(0, { 2, 4 })
            vim.notify("Archivo agregado")
        end)
    end)
end

vim.keymap.set("n", "<leader>cp", agregar_plugin)

vim.api.nvim_create_user_command("Menu", function()
    local options = { "option1", "option2", "option3" }
    vim.ui.select(options, {
        prompt = 'Select tabs or spaces:',
        format_item = function(item)
            return item
        end,
    }, function(choice)
        for _, option in ipairs(options) do
            if option == choice then
                vim.notify("Selected " .. choice)
            end
        end
    end)
end, {}
)
