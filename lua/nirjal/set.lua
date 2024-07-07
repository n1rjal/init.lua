vim.opt.guicursor = ""

vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.foldmethod = "manual"

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true
vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.wrap = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = "90"

vim.opt.completeopt = "menuone,noselect"

-- Set user emmet leader key to <Ctrl+Tab>
vim.cmd([[
    let g:user_emmet_leader_key = ','
]])

vim.opt.spell = false
vim.opt.spelllang = { "en_us" }
