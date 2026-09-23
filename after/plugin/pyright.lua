-- Neovim 0.10 uses the lspconfig setup API. `vim.lsp.config` / `vim.lsp.enable`
-- are the 0.11+ API and are nil here.
require("lspconfig").pyright.setup({
	cmd = { "pyright-langserver", "--stdio" },
	filetypes = { "python" },
	root_dir = require("lspconfig.util").root_pattern("pyproject.toml", "setup.py", ".git"),
	settings = {
		python = {
			analysis = {
				typeCheckingMode = "basic",
				autoSearchPaths = true,
				useLibraryCodeForTypes = true,
				preferGoToSourceDefinition = true,

				-- reduces django noise
				reportOptionalMemberAccess = "none",
				reportOptionalCall = "none",
				reportOptionalSubscript = "none",
				reportAssignmentType = "warning",
				reportGeneralTypeIssues = "warning",
			},
		},
	},
})
