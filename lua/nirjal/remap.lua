vim.g.mapleader = " "

-- for barbar --
vim.keymap.set("n", "<leader>w", "<cmd>:bd<CR>")
vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]])
vim.keymap.set("n", "<leader>q", "<cmd>BufferWipeout<CR>")
vim.keymap.set("n", "<leader>W", "<cmd>BufferRestore<CR>")

-- for lsp --
vim.keymap.set("n", "<leader>lr", "<cmd>:LspRestart<CR>")

-- for tagbar --
vim.keymap.set("n", "<leader>tt", "<cmd>:TagbarToggle<CR>")

-- for nullls --
vim.keymap.set({ "v", "n" }, "<leader>mp", function()
	vim.lsp.buf.format()
end)

vim.keymap.set("n", "<leader>ac", function()
	local input = vim.fn.input("msg: ")
	vim.cmd("G add .")
	vim.cmd('G commit -am "' .. input .. '"')
end)

-- for fugitive --
vim.keymap.set("n", "<leader>gg", "<cmd>:Git<CR>")
