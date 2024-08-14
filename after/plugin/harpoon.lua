require("harpoon").setup({
	global_settings = {
		save_on_toggle = true,
		save_on_change = true,
		excluded_filetypes = { "harpoon" },
		mark_branch = true,
		tabline = true,
	},
	menu = {
		width = vim.api.nvim_win_get_width(0) - 4,
	},
})

local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<leader>ha", mark.add_file)
vim.keymap.set("n", "<leader>hm", mark.add_file)
vim.keymap.set("n", "<leader>hh", ui.toggle_quick_menu)

vim.keymap.set("n", "<leader>1", function()
	ui.nav_file(1)
end)

vim.keymap.set("n", "<leader>2", function()
	ui.nav_file(2)
end)

vim.keymap.set("n", "<leader>3", function()
	ui.nav_file(3)
end)

vim.keymap.set("n", "<leader>4", function()
	ui.nav_file(4)
end)

vim.keymap.set("n", "<leader>5", function()
	ui.nav_file(5)
end)
