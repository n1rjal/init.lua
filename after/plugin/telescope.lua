local builtin = require('telescope.builtin')

-- leader ff to find_files hidden files are allowed
-- leader gf to git_files
vim.keymap.set('n', '<leader>gf', builtin.git_files, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>ps', builtin.live_grep, {})
vim.keymap.set('n', '<leader>vh', builtin.help_tags, {})
