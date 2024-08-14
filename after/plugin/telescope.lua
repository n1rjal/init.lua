local builtin = require("telescope.builtin")
require("telescope").load_extension("harpoon")

-- The code is setting up key mappings in Vim for
-- various Telescope commands.
vim.keymap.set("n", "<leader>gf", builtin.git_files, {})
vim.keymap.set("n", "<leader>gc", builtin.git_commits, {})
vim.keymap.set("n", "<leader>gC", builtin.git_bcommits, {})
vim.keymap.set("n", "<leader>gb", builtin.git_branches, {})

vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
vim.keymap.set("n", "<leader>bf", builtin.buffers, {})
vim.keymap.set("n", "<leader>rr", builtin.registers, {})
vim.keymap.set("n", "<leader>vh", builtin.help_tags, {})

vim.keymap.set("n", "<leader>ps", function()
	builtin.live_grep({
		additional_args = function()
			return {
				"--hidden", -- Search hidden files and directories
				"--no-ignore", -- Do not respect .gitignore, .ignore, etc.
				"-g",
				"!.git/*", -- Exclude the .git directory
				"-g",
				"!node_modules/*", -- Exclude node_modules
				"-g",
				"!__pycache__/*", -- Exclude __pycache__
				"-g",
				"!package-lock.json", -- Exclude package-lock.json
				"-g",
				"!yarn.lock", -- Exclude yarn.lock
				"-g",
				"!yarn-lock.yaml", -- Exclude yarn-lock.yaml
				"-g",
				"!build/*", -- Exclude build directories
				"-g",
				"!dist/*", -- Exclude dist directories
				"-g",
				"!target/*", -- Exclude Rust target directory
				"-g",
				"!*.pyc", -- Exclude compiled Python files
				"-g",
				"!*.o", -- Exclude compiled object files
				"-g",
				"!*.a", -- Exclude archive files
				"-g",
				"!*.out", -- Exclude compiled output files
				"--ignore-case", -- Case insensitive search
				"-g",
				"!.venv/*",
			}
		end,
	})
end, {})
