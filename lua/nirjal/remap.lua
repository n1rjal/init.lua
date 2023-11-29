vim.g.mapleader = " "

-- for barbar --
vim.keymap.set("n", "<leader>w", "<cmd>:bd<CR>")
vim.keymap.set("n", "[", "<cmd>:bprev<CR>")
vim.keymap.set("n", "]", "<cmd>:bnext<CR>")
vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]])
vim.keymap.set("n", "<leader>q", "<cmd>BufferWipeout<CR>")
vim.keymap.set("n", "<leader>W", "<cmd>BufferRestore<CR>")

-- for nvim-tree --
vim.keymap.set("n", "<leader>bb", "<cmd>:NvimTreeToggle<CR>")
vim.keymap.set("n", "<leader>bf", "<cmd>:NvimTreeFocus<CR>")

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

vim.keymap.set("n", "<leader>acp", function()
	local input = vim.fn.input("msg: ")
	local current_branch = vim.fn.system("git branch --show-current")
	vim.cmd("G add .")
	vim.cmd('G commit -am "' .. input .. '"')
	vim.cmd("G push origin " .. current_branch)
end)

vim.keymap.set("n", "[c", function()
	require("treesitter-context").go_to_context()
end, { silent = true })
