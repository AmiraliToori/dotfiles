return {
	-- Add the Dracula colorscheme plugin
	{
		"binhtran432k/dracula.nvim",
		lazy = false, -- Ensure it loads during startup
		priority = 1000, -- Load this before other plugins to prevent visual flashes
		config = function()
			-- You can add any specific dracula configuration options here.
			-- For example, to enable transparent background:
			-- vim.g.dracula_show_end_of_buffer = true
			-- vim.g.dracula_transparent_bg = true
		end,
	},

	-- Override LazyVim's default colorscheme setting
	{
		"LazyVim/LazyVim",
		opts = {
			colorscheme = "dracula",
		},
	},
}
