vim.g.mapleader = " "

-- for barbar --
vim.keymap.set("n", "<leader>w", "<cmd>:bd<CR>")
vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]])
vim.keymap.set("n", "<leader>q", "<cmd>BufferWipeout<CR>")
vim.keymap.set("n", "<leader>W", "<cmd>BufferRestore<CR>")
vim.keymap.set("n", "<leader>gmc", "<cmd>Gvdiffsplit!<CR>")
vim.cmd([[
    highlight SpellBad guifg=Yellow guibg=None gui=undercurl
]])

-- for lsp --
vim.keymap.set("n", "<leader>lr", "<cmd>:LspRestart<CR>")
vim.keymap.set("n", "<leader>ss", "<cmd>:Telescope spell_suggest<CR>")

-- for tagbar --
vim.keymap.set("n", "<leader>tt", "<cmd>:TagbarToggle<CR>")

-- for fugitive --
vim.keymap.set("n", "<leader>gg", "<cmd>:Git<CR>")
