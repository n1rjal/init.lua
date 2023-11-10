vim.g.mapleader = " "

-- The code `vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)` is setting a key mapping in Vim.
vim.keymap.set("n", "<leader>pd", vim.cmd.Ex)


-- for barbar --
vim.keymap.set("n", "<leader>w", "<cmd>BufferClose<CR>")
vim.keymap.set("n", "<leader>[", "<cmd>:BufferPrevious<CR>")
vim.keymap.set("n", "<leader>]", "<cmd>:BufferNext<CR>")
vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]])
vim.keymap.set("n", "<leader>q", "<cmd>BufferWipeout<CR>")
vim.keymap.set("n", "<leader>W", "<cmd>BufferRestore<CR>")

-- for nvim-tree --
vim.keymap.set('n', '<leader>bb', "<cmd>:NvimTreeToggle<CR>")
vim.keymap.set('n', '<leader>bf', "<cmd>:NvimTreeFocus<CR>")

-- for tagbar --
vim.keymap.set('n', '<leader>tt', "<cmd>:TagbarToggle<CR>")

-- for nullls --

vim.keymap.set({'v', 'n'}, '<leader>mp', function()
    vim.lsp.buf.format();
end)
