vim.lsp.config("pyright", {
	cmd = { "pyright-langserver", "--stdio" },
	filetypes = { "python" },
	root_markers = { "pyproject.toml", "setup.py", ".git" },
	settings = {
		python = {
			analysis = {
				typeCheckingMode = "basic",
				autoSearchPaths = true,
				useLibraryCodeForTypes = true,
				preferGoToSourceDefinition = true,

				-- reduces django noise
				reportAssignmentType = "warning",
				reportOptionalMemberAccess = "none",
				reportOptionalCall = "none",
				reportOptionalSubscript = "none",
				reportOptionalMemberAccess = "none",
				reportAssignmentType = "warning",
				reportGeneralTypeIssues = "warning",
			},
		},
	},
})

vim.lsp.enable("pyright")
