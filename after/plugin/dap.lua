local dap = require("dap")
local dapui = require("dapui")
local dappy = require("dap-python")

require("nvim-dap-virtual-text").setup()

local path = "/Library/Frameworks/Python.framework/Versions/3.11/bin/python3"

dap.listeners.after.event_initialized["dapui_config"] = function()
	dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
	dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
	dapui.close()
end

dappy.setup(path)
dapui.setup({
	sidebar = {
		elements = {
			-- You can change the order of elements in the sidebar
			"scopes",
			"breakpoints",
		},
		width = 40,
		position = "left", -- Can be "left" or "right"
	},
	tray = {
		elements = { "repl" },
		height = 10,
		position = "bottom", -- Can be "bottom" or "top"
	},
	floating = {
		max_height = 0.5, -- These can be integers or a float between 0 and 1.
		max_width = 0.5, -- Floats will be treated as percentage of your screen.
		mappings = {
			-- You can use the mappings key to style the telescope floating window.
			-- To disable a key, put [map] = false
			["<M-n>"] = false,
			["<M-p>"] = false,
			["<M-q>"] = dapui.close,
			["<CR>"] = dapui.eval,
		},
	},
})

table.insert(dap.configurations.python, {
	type = "python",
	request = "launch",
	name = "Launch file",
	program = "${file}",
	pythonPath = function()
		-- debugpy supports launching an application with a different interpreter then the one used to launch debugpy itself.
		-- The code below looks for a `venv` or `.venv` folder in the current directly and uses the python within.
		-- You could adapt this - to for example use the `VIRTUAL_ENV` environment variable.
		local cwd = vim.fn.getcwd()
		if vim.fn.executable(cwd .. "/venv/bin/python") == 1 then
			return cwd .. "/venv/bin/python"
		elseif vim.fn.executable(cwd .. "/.venv/bin/python") == 1 then
			return cwd .. "/.venv/bin/python"
		else
			return path
		end
	end,
})

dap.adapters["pwa-node"] = {
	type = "server",
	host = "127.0.0.1",
	port = 8123,
	executable = {
		command = "js-debug-adapter",
	},
}

for _, language in ipairs({ "typescript", "javascript" }) do
	dap.configurations[language] = {
		{
			type = "pwa-node",
			request = "launch",
			name = "Launch file",
			program = "${file}",
			cwd = vim.fn.getcwd(),
			runtimeExecutable = "node",
		},
	}
end

vim.api.nvim_set_keymap("n", "<leader>dc", '<cmd>lua require"dap".continue()<CR>', { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>dr", '<cmd>lua require"dap".repl.open()<CR>', { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>db", '<cmd>lua require"dap".toggle_breakpoint()<CR>', { noremap = true })
vim.api.nvim_set_keymap(
	"n",
	"<leader>dbc",
	'<cmd>lua require"dap".set_breakpoint(vim.fn.input("Breaking Condition: "))<CR>',
	{ noremap = true }
)
vim.api.nvim_set_keymap("n", "<leader>dn", '<cmd>lua require"dap".step_over()<CR>', { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>di", '<cmd>lua require"dap".step_into()<CR>', { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>do", '<cmd>lua require"dap".step_out()<CR>', { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>dl", '<cmd>lua require"dap".run_last()<CR>', { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>dui", '<cmd>lua require"dapui".toggle()<CR>', { noremap = true })
