require("lspconfig").pyright.setup({
	settings = {
		python = {
			analysis = {
				typeCheckingMode = "basic", -- Options are off, basic, or strict.
				autoSearchPaths = true,
				useLibraryCodeForTypes = true,
				autoImportCompletions = true,
				diagnosticModes = "openFilesOnly", -- Options are workspace or openFilesOnly.
			},
		},
	},
})
