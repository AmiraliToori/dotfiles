return {
	-- add symbols-outline
	{
		"simrat39/symbols-outline.nvim",
		cmd = "SymbolsOutline",
		keys = { { "<leader>cs", "<cmd>SymbolsOutline<cr>", desc = "Symbols Outline" } },
		opts = {
			-- add your options that should be passed to the setup() function here
			position = "right",
		},
	},

	{
		"neovim/nvim-lspconfig",
		opts = {
			servers = {
				-- Ensure pyright is the active server
				pyright = { enabled = false },
				basedpyright = {
					enabled = true,
					settings = {
						basedpyright = {
							analysis = {
								-- "off", "basic", "standard", "strict"
								typeCheckingMode = "off",
								useLibraryCodeForTypes = true,
								diagnosticMode = "openFilesOnly", -- reduce noise "workspace"
								diagnosticSeverityOverrides = {
									reportUnusedImport = false, -- let ruff handle unused imports
									reportUnusedVariable = false, -- let ruff handle unused vars
									reportMissingImports = false, -- keep useful import errors
								},
							},
						},
					},
				},
			},
		},
	},
}
