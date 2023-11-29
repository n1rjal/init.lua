local builtin = require("telescope.builtin")

-- The code is setting up key mappings in Vim for
-- various Telescope commands.
vim.keymap.set("n", "<leader>gf", builtin.git_files, {})
vim.keymap.set("n", "<leader>gc", builtin.git_commits, {})
vim.keymap.set("n", "<leader>gC", builtin.git_bcommits, {})
vim.keymap.set("n", "<leader>gb", builtin.git_branches, {})

vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
vim.keymap.set("n", "bf", builtin.buffers, {})
vim.keymap.set("n", "<leader>rr", builtin.registers, {})

vim.keymap.set("n", "<leader>ps", builtin.live_grep, {})
vim.keymap.set("n", "<leader>vh", builtin.help_tags, {})
