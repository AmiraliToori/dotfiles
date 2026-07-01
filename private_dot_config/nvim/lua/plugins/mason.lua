return {
	"mason-org/mason.nvim",
	lazy = false, -- Mason should be loaded eagerly for its functionality
	config = function()
		require("mason").setup()
	end,
	--dependencies = {
	--	"williamboman/mason-lspconfig.nvim",
	--	"WhoIsSethSanders/mason-tool-installer.nvim",
	--},
}
