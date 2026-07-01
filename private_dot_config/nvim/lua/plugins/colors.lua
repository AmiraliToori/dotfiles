return {
	"brenoprata10/nvim-highlight-colors",
	config = function()
		require("nvim-highlight-colors").setup({
			render = "background", -- Options: 'background', 'foreground', or 'at_column', 'virtual_symbol'
			enable_tailwind = true, -- CRITICAL: Enables Tailwind CSS color preview
			enable_short_hex = false,
			enable_named_colors = true,
		})
	end,
}
