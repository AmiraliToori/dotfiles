return {
	"lewis6991/gitsigns.nvim",
	lazy = true, -- Or configure it to load on demand
	config = function()
		require("gitsigns").setup()
	end,
}
