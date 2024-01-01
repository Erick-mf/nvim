vim.g.mapleader = " "
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.termguicolors = true
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.clipboard = "unnamedplus"
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.signcolumn = "yes"
vim.opt.colorcolumn = "120"
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.pumheight = 15
vim.opt.laststatus = 2
vim.opt.conceallevel = 3
vim.opt.showcmd = false
vim.opt.showmode = false
vim.opt.mouse = ""
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.scrolloff = 4
vim.opt.sidescrolloff = 4
vim.opt.smarttab = true
vim.opt.breakindent = true
vim.opt.wrap = false
vim.opt.guicursor = "i:ver30,v:hor30"
vim.opt.backspace = { "start", "eol", "indent" }
vim.opt.wildignore:append({ "*/node_modules/*" })
vim.opt.shortmess:append({ W = true, I = true, c = true, C = true })
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.list = false
vim.opt.smoothscroll = true

-- netrw
vim.g.netrw_banner = 0
vim.g.netrw_browse_split = 4 -- open in prior window
vim.g.netrw_altv = 1         -- change from left splitting to right splitting
vim.g.netrw_fastbrowse = 0
vim.g.netrw_winsize = 17
vim.g.codeium_disable_bindings = 1
